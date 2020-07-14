git_post_gitlab(){
  local id
  local target_project_name
  local token

  id=$(git_post_gitlab_format $pub)
  target_project_name=$(git_post_gitlab_format $push_url)

  git_post_gitlab_get_token
  git_post_gitlab_request
}
git_post_gitlab_format(){
  local formatted
  formatted=$1

  case $formatted in
    git@gitlab.com*)
      formatted=${formatted#git@gitlab.com:}
      ;;
    https://*@gitlab.com*)
      formatted=${formatted#https://*@gitlab.com/}
      ;;
  esac
  formatted=${formatted%.git}
  formatted=$(echo "${formatted}" | sed 's|/|%2F|')

  echo $formatted
}
git_post_gitlab_request(){
  local target_project_id
  local assignee_ids_opt
  local result

  target_project_id=$(curl -s -H "Private-Token: $token" "https://gitlab.com/api/v4/projects/$target_project_name" | cut -d'"' -f3 | sed 's/^:\([^,]*\),$/\1/')
  git_post_gitlab_set_assignee_ids_opt

  result=$(curl -i -s -H "Private-Token: $token" -d "id=$id" -d "title=$title" -d "description=$description" -d "source_branch=$current" -d "target_branch=$parent" -d "target_project_id=$target_project_id" $assignee_ids_opt -d remove_source_branch=true "https://gitlab.com/api/v4/projects/$id/merge_requests")

  echo "$result" | head -1
  echo "$result" | grep '"message":' | sed 's/"message": "\(.*\)",\?$/\1/'
}
git_post_gitlab_set_assignee_ids_opt(){
  local user
  local user_id
  local assignees

  if [ -n "$GITLAB_MERGE_REQUEST_ASSIGNEES" ]; then
    assignees=$GITLAB_MERGE_REQUEST_ASSIGNEES
    while [ true ]; do
      user=${assignees%%,*}
      user_id=$(curl -s -H "Private-Token: $token" "https://gitlab.com/api/v4/users?username=$user" | cut -d'"' -f3 | sed 's/^:\([^,]*\),$/\1/')
      if [ "$user_id" != "[]" ]; then
        assignee_ids_opt="${assignee_ids_opt} -d assignee_ids[]=$user_id"
      fi

      case "$assignees" in
        *,*)
          assignees=${assignees#*,}
          ;;
        *)
          break
          ;;
      esac
    done
    assignee_ids_opt=${assignee_ids_opt# }
  else
    assignee_ids_opt="-d assignee_id=$(curl -s -H "Private-Token: $token" "https://gitlab.com/api/v4/user" | cut -d'"' -f3 | sed 's/^:\([^,]*\),$/\1/')"
  fi
}
git_post_gitlab_get_token(){
  if [ -n "$GITLAB_ACCESS_TOKEN" ]; then
    token=$GITLAB_ACCESS_TOKEN
    return
  fi

  echo "GITLAB_ACCESS_TOKEN is empty"
  exit 1
}
