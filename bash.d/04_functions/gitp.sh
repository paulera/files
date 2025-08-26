function gitp(){
    
    GITP_KEY="~/.ssh/personal-id_rsa"

    if [[ "$1" =~ ^(hello|hi|yo|test|check|dry)$ ]]; then
        ssh -i ~/.ssh/personal-id_rsa -T git@github.com
    else
        GIT_SSH_COMMAND='ssh -i ~/.ssh/personal-id_rsa -o IdentitiesOnly=yes' git "$*"
    fi
}

alias gitp2="GIT_SSH_COMMAND='ssh -i ~/.ssh/personal-id_rsa -o IdentitiesOnly=yes' git"
