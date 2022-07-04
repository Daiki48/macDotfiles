# icons name
set -l separator_triangle           \ue0b0
set -l icon_cross                   \uf00d
set -l icon_plus                    \uf067 
set -l icon_three_point_reader      \uf6d7 
set -l icon_octocat                 \uf113
 
set segment_separator               $separator_triangle
set icon_miss                       $icon_cross
set icon_untracked                  $icon_three_point_reader
set icon_git_symbol                 $icon_octocat
set icon_git_dirty                  $icon_plus
 
set icon_home                       \uf7db
set icon_folder                     \uf07c
 
set color_user
set color_git_status_bar
 
function _segment
    set_color -b $argv[1] $argv[2]
    echo -n "$segment_separator "
end

# homeディレクトリかどうか
function _prompt_dir
 
    if [ $HOME = $PWD ]; 
        printf ' %s ' $icon_home
    else; 
        printf ' %s ' $icon_folder; 
    end
 
    printf ' %s ' (prompt_pwd)
    _segment $color_user $color_dark
end
 
# ユーザー名
function _prompt_user
    printf 'daiki ' (set_color $white)(whoami)
 
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        _change_color_git_status_bar
        _segment $color_git_status_bar $color_user;
    else
        _segment normal $color_user
    end
end
 
# git関連
function _git_prompt_untracked
    echo (command git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- :/ 2> /dev/null)
end
 
function _git_status_symbol
    if [ (_git_prompt_untracked) ]; echo -n "$icon_untracked "
    else if [ (_is_git_dirty) ]; echo -n "$icon_git_dirty "; end
end
 
function _change_color_git_status_bar
    if [ (_is_git_dirty) ]; set color_git_status_bar $color_git_dirty
    else; set color_git_status_bar $color_git_main; end
end
 
function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end
 
function _prompt_git
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
        set -l git_status_symbol (_git_status_symbol)
        _change_color_git_status_bar
        set_color -b $color_git_status_bar
        printf '%s ' (set_color $black)"$icon_git_symbol $git_branch $git_status_symbol"
        _segment normal $color_git_status_bar
    end
end
 
# promptの表示
function fish_prompt
 
    set -l last_status $status
 
    set_color -b $color_dark $white
 
    if [ $last_status -gt 0 ]
        echo -n (set_color $white)" $icon_miss "
        set color_user $color_warning
    else
        set color_user $color_main
    end
 
    _prompt_dir
    _prompt_user
    _prompt_git
    echo -e ''
    echo " » "(set_color normal)
end
