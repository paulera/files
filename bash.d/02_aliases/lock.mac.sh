# lock the computer. Mac only

if [ "$OS" = "mac" ]; then
    alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
fi
