# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Functions
__arguments () {
	# undefined
	builtin autoload -XUz
}
__git_prompt_git () {
	GIT_OPTIONAL_LOCKS=0 command git "$@"
}
__nvm () {
	declare previous_word
	previous_word="${COMP_WORDS[COMP_CWORD - 1]}" 
	case "${previous_word}" in
		(use | run | exec | ls | list | uninstall) __nvm_installed_nodes ;;
		(alias | unalias) __nvm_alias ;;
		(*) __nvm_commands ;;
	esac
	return 0
}
__nvm_alias () {
	__nvm_generate_completion "$(__nvm_aliases)"
}
__nvm_aliases () {
	declare aliases
	aliases="" 
	if [ -d "${NVM_DIR}/alias" ]
	then
		aliases="$(command cd "${NVM_DIR}/alias" && command find "${PWD}" -type f | command sed "s:${PWD}/::")" 
	fi
	echo "${aliases} node stable unstable iojs"
}
__nvm_commands () {
	declare current_word
	declare command
	current_word="${COMP_WORDS[COMP_CWORD]}" 
	COMMANDS='
    help install uninstall use run exec
    alias unalias reinstall-packages
    current list ls list-remote ls-remote
    install-latest-npm
    cache deactivate unload
    version version-remote which' 
	if [ ${#COMP_WORDS[@]} == 4 ]
	then
		command="${COMP_WORDS[COMP_CWORD - 2]}" 
		case "${command}" in
			(alias) __nvm_installed_nodes ;;
		esac
	else
		case "${current_word}" in
			(-*) __nvm_options ;;
			(*) __nvm_generate_completion "${COMMANDS}" ;;
		esac
	fi
}
__nvm_generate_completion () {
	declare current_word
	current_word="${COMP_WORDS[COMP_CWORD]}" 
	COMPREPLY=($(compgen -W "$1" -- "${current_word}")) 
	return 0
}
__nvm_installed_nodes () {
	__nvm_generate_completion "$(nvm_ls) $(__nvm_aliases)"
}
__nvm_options () {
	OPTIONS='' 
	__nvm_generate_completion "${OPTIONS}"
}
__sudo-replace-buffer () {
	local old=$1 new=$2 space=${2:+ } 
	if [[ $CURSOR -le ${#old} ]]
	then
		BUFFER="${new}${space}${BUFFER#$old }" 
		CURSOR=${#new} 
	else
		LBUFFER="${new}${space}${LBUFFER#$old }" 
	fi
}
__zoxide_cd () {
	\builtin cd -- "$@"
}
__zoxide_doctor () {
	[[ ${_ZO_DOCTOR:-1} -ne 0 ]] || return 0
	[[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] || return 0
	_ZO_DOCTOR=0 
	\builtin printf '%s\n' 'zoxide: detected a possible configuration issue.' 'Please ensure that zoxide is initialized right at the end of your shell configuration file (usually ~/.zshrc).' '' 'If the issue persists, consider filing an issue at:' 'https://github.com/ajeetdsouza/zoxide/issues' '' 'Disable this message by setting _ZO_DOCTOR=0.' '' >&2
}
__zoxide_hook () {
	\command zoxide add -- "$(__zoxide_pwd)"
}
__zoxide_pwd () {
	\builtin pwd -L
}
__zoxide_z () {
	__zoxide_doctor
	if [[ "$#" -eq 0 ]]
	then
		__zoxide_cd ~
	elif [[ "$#" -eq 1 ]] && {
			[[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]+$ ]]
		}
	then
		__zoxide_cd "$1"
	elif [[ "$#" -eq 2 ]] && [[ "$1" = "--" ]]
	then
		__zoxide_cd "$2"
	else
		\builtin local result
		result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")"  && __zoxide_cd "${result}"
	fi
}
__zoxide_zi () {
	__zoxide_doctor
	\builtin local result
	result="$(\command zoxide query --interactive -- "$@")"  && __zoxide_cd "${result}"
}
__zplug::base () {
	local load_file arg
	local -aU load_files
	while (( $# > 0 ))
	do
		arg="$1" 
		case "$arg" in
			(-* | --*) return 1 ;;
			(*/'*') load_files+=("$ZPLUG_ROOT/base/${arg:h}"/*.zsh(N-.))  ;;
			(*/*) load_files+=("$ZPLUG_ROOT/base/${arg}.zsh"(N-.))  ;;
			(*) return 1 ;;
		esac
		shift
	done
	if (( $#load_files == 0 ))
	then
		return 1
	fi
	fpath=("${load_files[@]:h}" "${fpath[@]}") 
	for load_file in "${load_files[@]}"
	do
		if (( $+functions[$load_file] ))
		then
			continue
		fi
		autoload -Uz "${load_file:t}" && eval "${load_file:t}" && unfunction "${load_file:t}"
	done
}
__zplug::base::base::get_os () {
	typeset -gx PLATFORM
	local os
	os="${(L)OSTYPE-"$(uname)"}" 
	case "$os" in
		(*'linux'*) PLATFORM='linux'  ;;
		(*'darwin'*) PLATFORM='darwin'  ;;
		(*'bsd'*) PLATFORM='bsd'  ;;
		(*) PLATFORM='unknown'  ;;
	esac
	echo "$PLATFORM"
}
__zplug::base::base::git_version () {
	if (( ! $+commands[git] ))
	then
		return 1
	fi
	__zplug::base::base::version_requirement ${(M)${(z)"$(git --version|head -1)"}:#[0-9]*} ">" "${@:?}"
	return $status
}
__zplug::base::base::is_cli () {
	[[ $- =~ s ]]
	return $status
}
__zplug::base::base::is_linux () {
	[[ ${(L)OSTYPE:-"$(uname)"} == *linux* ]]
}
__zplug::base::base::is_osx () {
	[[ ${(L)OSTYPE:-"$(uname)"} == *darwin* ]]
}
__zplug::base::base::osx_version () {
	(( $+commands[sw_vers] )) || return 1
	__zplug::base::base::version_requirement ${${(M)${(@f)"$(sw_vers)"}:#ProductVersion*}[2]} ">" "${@:?}"
	return $status
}
__zplug::base::base::packaging () {
	local k
	print -l "${(k)zplugs[@]}" | awk -f "$_ZPLUG_AWKPATH/packaging.awk" -v pkg="${1:?}"
}
__zplug::base::base::valid_semver () {
	local prev="$1" next="$2" 
	if [[ $prev == $next ]]
	then
		return 1
	fi
	if __zplug::base::base::version_requirement "$prev" ">" "$next"
	then
		return 1
	fi
	prev_elements=("${(s:.:)prev}") 
	next_elements=("${(s:.:)next}") 
	if (( $#next_elements != 3 ))
	then
		return 1
	fi
	return 0
}
__zplug::base::base::version_requirement () {
	local -i idx
	local -a min val
	local a="$1" op="$2" b="$3" 
	[[ $a == $b ]] && return 0
	val=("${(s:.:)a}") 
	min=("${(s:.:)b}") 
	case "$op" in
		(">") for ((idx=1; idx <= $#val; idx++ )) do
				if (( val[$idx] > ${min[$idx]:-0} ))
				then
					return 0
				elif (( val[$idx] < ${min[$idx]:-0} ))
				then
					return 1
				fi
			done ;;
		("<") for ((idx=1; idx <= $#val; idx++ )) do
				if (( val[$idx] < ${min[$idx]:-0} ))
				then
					return 0
				elif (( val[$idx] > ${min[$idx]:-0} ))
				then
					return 1
				fi
			done ;;
		(*)  ;;
	esac
	return 1
}
__zplug::base::base::zpluged () {
	local arg="$1" zplug repo 
	local -A zspec
	if [[ -z $arg ]]
	then
		(( $+zplugs ))
		return $status
	else
		if [[ $arg == $_ZPLUG_OHMYZSH ]]
		then
			for zplug in "${(k)zplugs[@]}"
			do
				__zplug::core::tags::parse "$zplug"
				zspec=("${reply[@]}") 
				case "$zspec[from]" in
					("oh-my-zsh") return 0 ;;
				esac
			done
		else
			repo="$arg" 
		fi
		(( $+zplugs[$repo] ))
		return $status
	fi
}
__zplug::base::base::zsh_version () {
	__zplug::base::base::version_requirement "$ZSH_VERSION" ">" "${@:?}"
	return $status
}
__zplug::core::add::on_cli () {
	local name
	local -a tags
	tags=(${(s/, /)argv[@]:gs/,  */, }) 
	name="$tags[1]" 
	tags[1]=() 
	if __zplug::base::base::zpluged "$name"
	then
		__zplug::io::print::f --die --zplug "$name: already managed\n"
		return 1
	fi
	echo "zplug ${(qqq)name}${tags[@]:+", ${(j:, :)${(q)tags[@]}}"}" >>| "$ZPLUG_LOADFILE"
}
__zplug::core::add::proc_at-sign () {
	local name="$1" key 
	local -i max=0 
	for key in "${(k)zplugs[@]}"
	do
		if [[ $key =~ ^$name@*$ ]] && (( $max < $#key ))
		then
			max=$#key 
			name="${key}@" 
		fi
	done
	echo "$name"
}
__zplug::core::add::to_zplugs () {
	local name="$1" 
	local tag key val
	local -a tags
	local -a re_tags
	if [[ -p /dev/stdin ]]
	then
		__zplug::core::migration::pipe
		return $status
	fi
	if [[ ! $name =~ [~$/] ]] && [[ ! $name =~ "^[^/]+/[^/]+$" ]]
	then
		__zplug::io::print::f --die --zplug --error "${(qq)name} is invalid package name\n"
		return 1
	fi
	if __zplug::base::base::is_cli
	then
		__zplug::core::add::on_cli "$argv[@]"
	fi
	tags=(${(s/, /)argv[@]:gs/,  */, }) 
	name="$(__zplug::core::add::proc_at-sign "$tags[1]")" 
	tags[1]=() 
	for tag in "${tags[@]}"
	do
		key=${${(s.:.)tag}[1]} 
		val=${${(s.:.)tag}[2]} 
		if (( $+_zplug_tags[$key] ))
		then
			case $key in
				("of" | "file" | "commit" | "do" | "nice") __zplug::core::migration::tags "$key" ;;
				("from") __zplug::core::sources::call "$val" ;;
			esac
			re_tags+=("$key:$val") 
		else
			__zplug::io::print::f --die --zplug "$tag: '$key' is invalid tag name\n"
			return 1
		fi
	done
	__zplug::core::sources::use_default
	zplugs+=("$name" "${(j:, :)re_tags[@]:-}") 
}
__zplug::core::arguments::auto_correct () {
	local arg="$1" 
	local -i ret=0 
	local -a cmds reply_cmds
	reply_cmds=() 
	__zplug::core::commands::user_defined
	reply_cmds+=("${reply[@]}") 
	__zplug::core::commands::get --key
	reply_cmds+=("${reply[@]}") 
	cmds=(${(@f)"$(awk \
        -f "$_ZPLUG_AWKPATH/fuzzy.awk" \
        -v search_string="$arg" \
        <<<"${(F)reply_cmds:gs:_:}"
    )":-}) 
	case $#cmds in
		(0) __zplug::io::print::f --die --zplug "$arg: no such command\n"
			ret=1  ;;
		(1) __zplug::io::print::f --die --zplug --warn "You called a zplug command named '%s', which does not exist.\n" "Continuing under the assumption that you meant '%s'.\n" -- "$arg" "$fg[green]$cmds[1]$reset_color"
			reply=("$cmds[1]")  ;;
		(*) __zplug::io::print::f --die --zplug --warn "'%s' is not a zplug command. see 'zplug --help'.\n" "Did you mean one of these?\n" -- "$arg"
			__zplug::io::print::die "$fg[yellow]\t- $reset_color%s\n" "${cmds[@]}"
			ret=1  ;;
	esac
	return $ret
}
__zplug::core::arguments::exec () {
	local arg="$1" 
	shift
	reply=() 
	__zplug::core::commands::user_defined
	if [[ -n ${(M)reply[@]:#$arg} ]]
	then
		eval "$commands[zplug-$arg]" "$argv[@]"
		return $status
	fi
	if (( $+functions[zplug-$arg] ))
	then
		zplug-$arg "$argv[@]"
		return $status
	fi
	if ! __zplug::core::arguments::auto_correct "$arg"
	then
		return 1
	fi
	zplug "$reply[1]" "$argv[@]"
}
__zplug::core::arguments::none () {
	:
}
__zplug::core::cache::commands () {
	local repo="${1:?}" 
	local -A tags
	__zplug::core::load::skip_condition "$repo" && return 0
	tags[from]="$(__zplug::core::core::run_interfaces "from" "$repo")" 
	__zplug::utils::git::checkout "$repo"
	if __zplug::core::sources::is_handler_defined "load_command" "$tags[from]"
	then
		__zplug::core::sources::use_handler "load_command" "$tags[from]" "$repo"
		__zplug::core::cache::commit repo "$repo" "$reply[@]"
	fi
}
__zplug::core::cache::commit () {
	local pkg pair hook
	local -A hook_load
	local -A reply_hash
	local -A load_commands
	local -aU load_plugins load_fpaths lazy_plugins defer_1_plugins defer_2_plugins defer_3_plugins
	local -aU unclassified_plugins
	local repo param params
	reply_hash=("$argv[@]") 
	lazy_plugins=(${(@f)reply_hash[lazy_plugins]}) 
	load_fpaths=(${(@f)reply_hash[load_fpaths]}) 
	load_plugins=(${(@f)reply_hash[load_plugins]}) 
	load_themes=(${(@f)reply_hash[load_themes]}) 
	defer_1_plugins=(${(@f)reply_hash[defer_1_plugins]}) 
	defer_2_plugins=(${(@f)reply_hash[defer_2_plugins]}) 
	defer_3_plugins=(${(@f)reply_hash[defer_3_plugins]}) 
	unclassified_plugins=(${(@f)reply_hash[unclassified_plugins]}) 
	for pair in ${(@f)reply_hash[load_commands]}
	do
		load_commands+=(${(@s:\0:)pair}) 
	done
	for pair in ${reply_hash[hook_load]}
	do
		hook="${${(@s:\0:)pair}[2,-1]}" 
	done
	repo="$reply_hash[repo]" 
	param="--repo ${(qqq)repo}" 
	if [[ -n $hook ]]
	then
		param+=" --hook ${(qqq)hook}" 
	fi
	for pkg in "$load_plugins[@]"
	do
		params="$param ${(qqq)pkg}" 
		__zplug::job::handle::flock "$_zplug_cache[plugin]" "__zplug::core::load::as_plugin $params"
	done
	for pkg in "$defer_1_plugins[@]"
	do
		params="$param ${(qqq)pkg}" 
		__zplug::job::handle::flock "$_zplug_cache[defer_1_plugin]" "__zplug::core::load::as_plugin $params"
	done
	for pkg in "$defer_2_plugins[@]"
	do
		params="$param ${(qqq)pkg}" 
		__zplug::job::handle::flock "$_zplug_cache[defer_2_plugin]" "__zplug::core::load::as_plugin $params"
	done
	for pkg in "$defer_3_plugins[@]"
	do
		params="$param ${(qqq)pkg}" 
		__zplug::job::handle::flock "$_zplug_cache[defer_3_plugin]" "__zplug::core::load::as_plugin $params"
	done
	for pkg in "$lazy_plugins[@]"
	do
		params="$param ${(qqq)pkg} --lazy" 
		__zplug::job::handle::flock "$_zplug_cache[lazy_plugin]" "__zplug::core::load::as_plugin $params"
	done
	for pkg in "$load_fpaths[@]"
	do
		__zplug::job::handle::flock "$_zplug_cache[fpath]" "$pkg"
	done
	for pkg in "${(k)load_commands[@]}"
	do
		params="$param --path ${(qqq)load_commands[$pkg]} ${(qqq)pkg}" 
		__zplug::job::handle::flock "$_zplug_cache[command]" "__zplug::core::load::as_command $params"
	done
	for pkg in "$load_themes[@]"
	do
		params="$param ${(qqq)pkg}" 
		__zplug::job::handle::flock "$_zplug_cache[theme]" "__zplug::core::load::as_theme $params"
	done
}
__zplug::core::cache::diff () {
	local key file
	local is_verbose
	zstyle -s ':zplug:core:load' 'verbose' is_verbose
	$ZPLUG_USE_CACHE || return 2
	if [[ -d $ZPLUG_CACHE_DIR ]]
	then
		diff -b <(__zplug::core::cache::expose) <(__zplug::core::interface::expose) 2> >(__zplug::log::capture::error) > /dev/null
		case $status in
			(0) if (( $_zplug_boolean_true[(I)$is_verbose] ))
				then
					__zplug::io::print::f --zplug "Loaded from cache ($ZPLUG_CACHE_DIR)\n"
				fi
				return 0 ;;
			(1)  ;;
			(2)  ;;
		esac
	fi
	for file in "${(k)_zplug_cache[@]}"
	do
		__zplug::core::cache::set_file "$file"
	done
	return 1
}
__zplug::core::cache::expose () {
	if [[ -f $_zplug_cache[interface] ]]
	then
		command cat "$_zplug_cache[interface]"
	fi
}
__zplug::core::cache::plugins () {
	local repo="${1:?}" 
	local -A tags
	__zplug::core::load::skip_condition "$repo" && return 0
	tags[from]="$(__zplug::core::core::run_interfaces "from" "$repo")" 
	__zplug::utils::git::checkout "$repo"
	if __zplug::core::sources::is_handler_defined "load_plugin" "$tags[from]"
	then
		__zplug::core::sources::use_handler "load_plugin" "$tags[from]" "$repo"
		__zplug::core::cache::commit repo "$repo" "$reply[@]"
	fi
}
__zplug::core::cache::set_file () {
	local file="${1:?}" 
	if (( ! $+_zplug_cache[$file] ))
	then
		return 1
	fi
	__zplug::core::migration::cache_file_dir
	rm -f "$_zplug_cache[$file]"
	touch "$_zplug_cache[$file]"
}
__zplug::core::cache::themes () {
	local repo="${1:?}" 
	local -A tags
	__zplug::core::load::skip_condition "$repo" && return 0
	tags[from]="$(__zplug::core::core::run_interfaces "from" "$repo")" 
	__zplug::utils::git::checkout "$repo"
	if __zplug::core::sources::is_handler_defined "load_theme" "$tags[from]"
	then
		__zplug::core::sources::use_handler "load_theme" "$tags[from]" "$repo"
		__zplug::core::cache::commit repo "$repo" "$reply[@]"
	fi
	setopt prompt_subst
}
__zplug::core::cache::update () {
	__zplug::core::interface::expose >| "$_zplug_cache[interface]"
}
__zplug::core::commands::get () {
	__zplug::core::core::get_interfaces "commands" "$argv[@]"
}
__zplug::core::commands::user_defined () {
	local -a user_cmds
	reply=() 
	user_cmds=(${^path[@]}/zplug-*(N-.:t:gs:zplug-:)) 
	if (( $#user_cmds > 0 ))
	then
		reply+=("${(u)user_cmds[@]}") 
		return 0
	fi
	return 1
}
__zplug::core::core::get_interfaces () {
	local arg name desc
	local target
	local -a targets
	local interface
	local -A interfaces
	local is_key=false is_prefix=false 
	while (( $# > 0 ))
	do
		arg="$1" 
		case "$arg" in
			(--key) is_key=true  ;;
			(--prefix) is_prefix=true  ;;
			(-* | --*)  ;;
			("")  ;;
			(*) targets+=("$arg")  ;;
		esac
		shift
	done
	reply=() 
	for target in "${targets[@]}"
	do
		interfaces=() 
		for interface in "$ZPLUG_ROOT/autoload/$target"/__*__(N-.)
		do
			name="${interface:t:gs:_:}" 
			if $is_prefix
			then
				name="__${name}__" 
			fi
			desc="" 
			while IFS= read -r line
			do
				if [[ "$line" =~ "# Description:" ]]
				then
					IFS= read -r desc
					regexp-replace desc "^# *" ""
					break
				fi
			done < "$interface"
			interfaces[$name]="$desc" 
		done
		if $is_key
		then
			reply+=("${(k)interfaces[@]}") 
		else
			reply+=("${(kv)interfaces[@]}") 
		fi
	done
}
__zplug::core::core::prepare () {
	{
		if ! __zplug::base::base::zsh_version 4.3.9
		then
			__zplug::io::print::f --die --zplug --error "zplug does not work this version of zsh $ZSH_VERSION.\n" "You must use zsh 4.3.9 or later.\n"
			return 1
		fi
		if ! __zplug::base::base::git_version 1.7
		then
			__zplug::io::print::f --die --zplug --error "git command not found in \$PATH\n" "zplug depends on git 1.7 or later.\n"
			return 1
		fi
		if ! __zplug::utils::awk::available
		then
			__zplug::io::print::f --die --zplug --error 'No available AWK variant in your $PATH\n'
			return 1
		fi
	}
	__zplug::core::core::variable || return 1
	typeset -gx -U path
	typeset -gx -U fpath
	path=(${ZPLUG_ROOT:+"$ZPLUG_ROOT/bin"} ${ZPLUG_BIN:-${ZPLUG_HOME:+"$ZPLUG_HOME/bin"}} "$path[@]") 
	fpath=("$ZPLUG_ROOT"/misc/completions(N-/) "$ZPLUG_ROOT/base/sources" "$fpath[@]") 
	mkdir -p "$ZPLUG_HOME"/{,log}
	mkdir -p "$ZPLUG_BIN"
	mkdir -p "$ZPLUG_CACHE_DIR"
	mkdir -p "$ZPLUG_REPOS"
	touch "$_zplug_log[trace]"
	if (( ! $+functions[_zplug] ))
	then
		compinit -C -d "$ZPLUG_HOME/zcompdump"
	fi
}
__zplug::core::core::run_interfaces () {
	local arg="$1" 
	shift
	local interface
	local -i ret=0 
	interface="__${arg:gs:_:}__" 
	if (( ! $+functions[$interface] ))
	then
		autoload -Uz "$interface"
	fi
	${=interface} "$argv[@]"
	ret=$status 
	unfunction "$interface" &> /dev/null
	return $ret
}
__zplug::core::core::variable () {
	export FPATH="$ZPLUG_ROOT/autoload:$FPATH" 
	typeset -gx ZPLUG_HOME=${ZPLUG_HOME:-~/.zplug} 
	typeset -gx -i ZPLUG_THREADS=${ZPLUG_THREADS:-16} 
	typeset -gx ZPLUG_PROTOCOL=${ZPLUG_PROTOCOL:-HTTPS} 
	typeset -gx ZPLUG_FILTER=${ZPLUG_FILTER:-"fzf-tmux:fzf:peco:percol:fzy:zaw"} 
	typeset -gx ZPLUG_LOADFILE=${ZPLUG_LOADFILE:-$ZPLUG_HOME/packages.zsh} 
	typeset -gx ZPLUG_USE_CACHE=${ZPLUG_USE_CACHE:-true} 
	typeset -gx ZPLUG_SUDO_PASSWORD
	typeset -gx ZPLUG_ERROR_LOG=${ZPLUG_ERROR_LOG:-$ZPLUG_HOME/.error_log} 
	typeset -gx ZPLUG_LOG_LOAD_SUCCESS=${ZPLUG_LOG_LOAD_SUCCESS:-false} 
	typeset -gx ZPLUG_LOG_LOAD_FAILURE=${ZPLUG_LOG_LOAD_FAILURE:-false} 
	typeset -gx ZPLUG_BIN=${ZPLUG_BIN:-$ZPLUG_HOME/bin} 
	typeset -gx ZPLUG_CACHE_DIR=${ZPLUG_CACHE_DIR:-$ZPLUG_HOME/cache} 
	typeset -gx ZPLUG_REPOS=${ZPLUG_REPOS:-$ZPLUG_HOME/repos} 
	typeset -gx _ZPLUG_VERSION="2.4.2" 
	typeset -gx _ZPLUG_URL="https://github.com/zplug/zplug" 
	typeset -gx _ZPLUG_OHMYZSH="robbyrussell/oh-my-zsh" 
	typeset -gx _ZPLUG_PREZTO="sorin-ionescu/prezto" 
	typeset -gx _ZPLUG_AWKPATH="$ZPLUG_ROOT/misc/contrib" 
	typeset -gx -A _zplug_status
	_zplug_status=("success" 0 "failure" 1 "true" 0 "false" 1 "self_return" 101 "error" 1 "builtin_error" 2 "diff_binary" 2 "command_not_executable" 126 "command_not_found" 127 "exit_syntax_error" 128 "error_signal_hup" 129 "error_signal_int" 130 "error_signal_kill" 137 "up_to_date" 10 "out_of_date" 11 "unknown" 12 "repo_not_found" 13 "skip_if" 14 "skip_frozen" 15 "skip_local" 16 "not_git_repo" 17 "not_on_branch" 18 "detached_head" 18 "revision_lock" 19) 
	typeset -gx -A _zplug_log _zplug_build_log _zplug_load_log
	_zplug_log=("trace" "$ZPLUG_HOME/log/trace.log" "install" "$ZPLUG_HOME/log/install.log" "update" "$ZPLUG_HOME/log/update.log" "status" "$ZPLUG_HOME/log/status.log") 
	_zplug_build_log=("success" "$ZPLUG_HOME/log/build_success.log" "failure" "$ZPLUG_HOME/log/build_failure.log" "timeout" "$ZPLUG_HOME/log/build_timeout.log" "rollback" "$ZPLUG_HOME/log/build_rollback.log") 
	_zplug_load_log=("success" "$ZPLUG_HOME/log/load_success.log" "failure" "$ZPLUG_HOME/log/load_failure.log") 
	typeset -gx -A _zplug_cache
	_zplug_cache=("interface" "$ZPLUG_CACHE_DIR/interface" "plugin" "$ZPLUG_CACHE_DIR/plugin.zsh" "lazy_plugin" "$ZPLUG_CACHE_DIR/lazy_plugin.zsh" "theme" "$ZPLUG_CACHE_DIR/theme.zsh" "command" "$ZPLUG_CACHE_DIR/command.zsh" "fpath" "$ZPLUG_CACHE_DIR/fpath.zsh" "defer_1_plugin" "$ZPLUG_CACHE_DIR/defer_1_plugin.zsh" "defer_2_plugin" "$ZPLUG_CACHE_DIR/defer_2_plugin.zsh" "defer_3_plugin" "$ZPLUG_CACHE_DIR/defer_3_plugin.zsh") 
	typeset -gx -A _zplug_lock
	_zplug_lock=("job" "$ZPLUG_HOME/log/job.lock") 
	if (( $+ZPLUG_SHALLOW ))
	then
		__zplug::io::print::f --die --zplug --warn "ZPLUG_SHALLOW is deprecated. " "Please use 'zstyle :zplug:tag depth 1' instead.\n"
	fi
	if (( $+ZPLUG_CACHE_FILE ))
	then
		__zplug::io::print::f --die --zplug --warn "ZPLUG_CACHE_FILE is deprecated. " "Please use 'ZPLUG_CACHE_DIR' instead.\n"
	fi
	if (( $+ZPLUG_CLONE_DEPTH ))
	then
		__zplug::io::print::f --die --zplug --warn "ZPLUG_CLONE_DEPTH is deprecated. " "Please use 'zstyle :zplug:tag depth $ZPLUG_CLONE_DEPTH' instead.\n"
	fi
	{
		typeset -gx -A -U _zplug_options _zplug_commands _zplug_tags
		__zplug::core::options::get
		_zplug_options=("${reply[@]}") 
		__zplug::core::commands::get
		_zplug_commands=("${reply[@]}") 
		__zplug::core::tags::get
		_zplug_tags=("${reply[@]}") 
	}
	{
		typeset -gx -a _zplug_boolean_true _zplug_boolean_false
		_zplug_boolean_true=("true" "yes" "on" 1) 
		_zplug_boolean_false=("false" "no" "off" 0) 
	}
	{
		local -a only_subshell
		typeset -gx _ZPLUG_CONFIG_SUBSHELL=":" 
		zstyle -a ":zplug:config:setopt" only_subshell only_subshell
		zstyle -t ":zplug:config:setopt" same_curshell
		if (( $_zplug_boolean_true[(I)$same_curshell] ))
		then
			only_subshell=("${only_subshell[@]:gs:_:}" $(setopt)) 
		fi
		if (( $#only_subshell > 0 ))
		then
			_ZPLUG_CONFIG_SUBSHELL="setopt ${(u)only_subshell[@]}" 
		fi
	}
	zmodload zsh/terminfo
	typeset -gx -A em
	em[under]="$terminfo[smul]" 
	em[bold]="$terminfo[bold]" 
}
__zplug::core::interface::expose () {
	local name
	for name in "${(ok)zplugs[@]}"
	do
		echo "${name}${zplugs[$name]:+, ${(os:, :)zplugs[$name]}}"
	done
}
__zplug::core::load::as_command () {
	local key value repo load_path _path hook
	local is_verbose
	local -i status_code=0 
	zstyle -s ':zplug:core:load' 'verbose' is_verbose
	while (( $#argv > 0 ))
	do
		case "$argv[1]" in
			(--repo) repo="$argv[2]" 
				shift ;;
			(--hook) hook="$argv[2]" 
				shift ;;
			(--path) _path="$argv[2]" 
				shift ;;
			(*) load_path="$argv[1]"  ;;
		esac
		shift
	done
	{
		chmod 755 "$load_path"
		ln -snf "$load_path" "$_path"
	} &> /dev/null
	status_code=$status 
	if (( $_zplug_boolean_true[(I)$is_verbose] ))
	then
		if (( $status_code == 0 ))
		then
			__zplug::io::print::f " Link ${(qqq)load_path/$HOME/~} ($repo)\n"
		else
			__zplug::io::print::f --warn " Failed to link ${(qqq)load_path/$HOME/~} ($repo)\n"
		fi
	fi
	if (( $status_code == 0 ))
	then
		if [[ -n $hook ]]
		then
			eval ${=hook}
		fi
		$ZPLUG_LOG_LOAD_SUCCESS && __zplug::job::handle::flock "$_zplug_load_log[success]" "$repo"
	else
		$ZPLUG_LOG_LOAD_FAILURE && __zplug::job::handle::flock "$_zplug_load_log[failure]" "$repo"
	fi
	return $status_code
}
__zplug::core::load::as_plugin () {
	local key value repo load_path hook is_lazy=false 
	local is_verbose msg
	local -i status_code=0 
	zstyle -s ':zplug:core:load' 'verbose' is_verbose
	while (( $#argv > 0 ))
	do
		case "$argv[1]" in
			(--repo) repo="$argv[2]" 
				shift ;;
			(--hook) hook="$argv[2]" 
				shift ;;
			(--lazy) is_lazy=true  ;;
			(*) load_path="$argv[1]"  ;;
		esac
		shift
	done
	if [[ $repo == 'zplug/zplug' ]]
	then
		return 0
	fi
	if [[ $load_path =~ $_ZPLUG_OHMYZSH ]]
	then
		if [[ -z $ZSH ]]
		then
			export ZSH="$ZPLUG_REPOS/$_ZPLUG_OHMYZSH" 
			export ZSH_CACHE_DIR="$ZSH/cache/" 
		fi
	fi
	if $is_lazy
	then
		msg="Lazy" 
		autoload -Uz "${load_path:t}"
		status_code=$status 
	else
		msg="Load" 
		source "$load_path" 2> >(__zplug::log::capture::error)
		status_code=$status 
	fi
	if (( $_zplug_boolean_true[(I)$is_verbose] ))
	then
		if (( $status_code == 0 ))
		then
			__zplug::io::print::f " $msg ${(qqq)load_path/$HOME/~} ($repo)\n"
		else
			__zplug::io::print::f --warn " Failed to load ${(qqq)load_path/$HOME/~} ($repo)\n"
		fi
	fi
	if (( $status_code == 0 ))
	then
		if [[ -n $hook ]]
		then
			eval ${=hook}
		fi
		$ZPLUG_LOG_LOAD_SUCCESS && __zplug::job::handle::flock "$_zplug_load_log[success]" "$repo"
	else
		$ZPLUG_LOG_LOAD_FAILURE && __zplug::job::handle::flock "$_zplug_load_log[failure]" "$repo"
	fi
	return $status_code
}
__zplug::core::load::as_theme () {
	local -i ret=0 
	__zplug::core::load::as_plugin "$argv[@]"
	ret=$status 
	if [[ ! -o prompt_subst ]]
	then
		setopt prompt_subst
	fi
	return $ret
}
__zplug::core::load::from_cache () {
	local is_verbose
	zstyle -s ':zplug:core:load' 'verbose' is_verbose
	__zplug::core::cache::update
	{
		fpath=(${(@f)"$(<$_zplug_cache[fpath])"} "$fpath[@]") 
		source "$_zplug_cache[plugin]"
		source "$_zplug_cache[lazy_plugin]"
		source "$_zplug_cache[theme]"
		source "$_zplug_cache[command]"
		source "$_zplug_cache[defer_1_plugin]"
		compinit -d "$ZPLUG_HOME/zcompdump"
		if (( $_zplug_boolean_true[(I)$is_verbose] ))
		then
			__zplug::io::print::f --zplug "$fg[yellow]Run compinit$reset_color\n"
		fi
		source "$_zplug_cache[defer_2_plugin]"
		source "$_zplug_cache[defer_3_plugin]"
	}
	if [[ -s $_zplug_load_log[failure] ]]
	then
		__zplug::io::print::f --zplug "These repos have failed to load:\n$fg_bold[red]"
		print -l -- "- $fg[red]"${^${(u@f)"$(<"$_zplug_load_log[failure]")":gs:@:}}"$reset_color"
		__zplug::io::print::f "$reset_color"
		return 1
	fi
}
__zplug::core::load::prepare () {
	setopt nomonitor
	zstyle ':zplug:core:load' 'verbose' no
	$ZPLUG_LOG_LOAD_SUCCESS && __zplug::io::file::rm_touch "$_zplug_load_log[success]"
	$ZPLUG_LOG_LOAD_FAILURE && __zplug::io::file::rm_touch "$_zplug_load_log[failure]"
}
__zplug::core::load::skip_condition () {
	local repo="${1:?}" is_verbose 
	local -A tags
	zstyle -s ':zplug:core:load' 'verbose' is_verbose
	__zplug::core::tags::parse "$repo"
	tags=("${reply[@]}") 
	if __zplug::core::sources::is_handler_defined check "$tags[from]"
	then
		if ! __zplug::core::sources::use_handler check "$tags[from]" "$repo"
		then
			return 0
		fi
	else
		if [[ ! -d $tags[dir] ]]
		then
			return 0
		fi
	fi
	if [[ -n $tags[if] ]]
	then
		if ! eval "$tags[if]" 2> >(__zplug::log::capture::error) > /dev/null
		then
			if (( $_zplug_boolean_true[(I)$is_verbose] ))
			then
				__zplug::io::print::die "$tags[name]: (not loaded)\n"
			fi
			return 0
		fi
	fi
	if [[ -n $tags[on] ]]
	then
		__zplug::core::core::run_interfaces 'check' ${~tags[on]}
		if (( $status != 0 ))
		then
			if (( $_zplug_boolean_true[(I)$is_verbose] ))
			then
				__zplug::io::print::die "$tags[name]: (not loaded)\n"
			fi
			return 0
		fi
	fi
	return 1
}
__zplug::core::migration::cache_file_dir () {
	if [[ -f $ZPLUG_CACHE_DIR ]]
	then
		rm -f "$ZPLUG_CACHE_DIR"
	fi
	mkdir -p "$ZPLUG_CACHE_DIR"
}
__zplug::core::migration::pipe () {
	__zplug::io::print::f --die --zplug --warn "pipe syntax is deprecated! Please use '%s' tag instead.\n" "$fg[blue]on$reset_color"
	return 1
}
__zplug::core::migration::tags () {
	local key="$1" new_key 
	case "$key" in
		("of") new_key="use"  ;;
		("file") new_key="rename-to"  ;;
		("commit") new_key="at"  ;;
		("do") new_key="hook-build"  ;;
		("nice") new_key="defer"  ;;
		(*) __zplug::io::print::f --die --zplug "$key: this tag is still good\n"
			return 1 ;;
	esac
	__zplug::io::print::f --die --zplug --warn "'%s' tag is deprecated. Please use '%s' tag instead (%s).\n" "$fg[blue]$key$reset_color" "$fg[blue]$new_key$reset_color" "$fg[green]${name:gs:@::}$reset_color"
	return 1
}
__zplug::core::options::get () {
	__zplug::core::core::get_interfaces "options" "$argv[@]"
}
__zplug::core::options::long () {
	local key value
	local -a args opts
	__zplug::utils::shell::getopts "$argv[@]" | while read key value
	do
		case "$key" in
			(_) args+=("$value")  ;;
			(*) opts+=("$key") 
				args+=("$value")  ;;
		esac
	done
	opt="$opts[1]" 
	if [[ -f $ZPLUG_ROOT/autoload/options/__${opt}__ ]]
	then
		__zplug::core::core::run_interfaces "$opt" "$args[@]"
		return $status
	else
		__zplug::core::options::unknown "$argv[1]"
		return $status
	fi
}
__zplug::core::options::parse () {
	local arg
	local -i ret=1 
	while (( $# > 0 ))
	do
		arg="$1" 
		case "$arg" in
			("--")  ;;
			("-")  ;;
			(--*) __zplug::core::options::long "$arg" ${2:+"$argv[2,-1]"}
				ret=$status  ;;
			(-*) __zplug::core::options::short "$arg" ${2:+"$argv[2,-1]"}
				ret=$status  ;;
			(*)  ;;
		esac
		shift
	done
	return $ret
}
__zplug::core::options::short () {
	__zplug::core::options::unknown "$arg"
	return $status
}
__zplug::core::options::unknown () {
	local arg="$1" 
	__zplug::io::print::f --die --zplug "$arg: unknown option\n"
	return 1
}
__zplug::core::self::info () {
	local arg
	local -A revisions
	__zplug::utils::git::status "zplug/zplug"
	revisions=("$reply[@]") 
	while (( $# > 0 ))
	do
		arg="$1" 
		case "$arg" in
			(--up-to-date) if [[ $revisions[local] == $revisions[master] ]]
				then
					return 0
				fi
				return 1 ;;
			(--local) echo "$revisions[local]" ;;
			(--HEAD) echo "$revisions[master]" ;;
			(--version) echo "$revisions[$_ZPLUG_VERSION^\{\}]" ;;
			(-* | --*) return 1 ;;
		esac
		shift
	done
}
__zplug::core::self::init () {
	local repo="zplug/zplug" 
	local src="$ZPLUG_REPOS/$repo/init.zsh" 
	local dst="$ZPLUG_HOME/init.zsh" 
	if [[ ! -f $src ]]
	then
		__zplug::log::write::error "$src: no such file or directory"
		return 1
	fi
	ln -snf "$src" "$dst"
}
__zplug::core::self::load () {
	__zplug::core::self::init
}
__zplug::core::self::update () {
	local ret=0 
	local HEAD
	if ! __zplug::base::base::zpluged "zplug/zplug"
	then
		__zplug::io::print::f --die --zplug "zplug/zplug: no package managed by zplug\n"
		return 1
	fi
	if ! __zplug::core::self::info --up-to-date
	then
		__zplug::sources::github::update "zplug/zplug"
		ret=$status 
		if (( $ret == $_zplug_status[up_to_date] ))
		then
			ret=$_zplug_status[self_return] 
		fi
		return $ret
	fi
	__zplug::core::self::info --HEAD | read HEAD
	__zplug::io::print::f --die --zplug "%s (v%s) %s\n" "$fg[white]up-to-date$reset_color" "$_ZPLUG_VERSION" "$em[under]$HEAD[1,8]$reset_color"
	__zplug::log::write::info "zplug is up-to-date"
	return $_zplug_status[self_return]
}
__zplug::core::sources::call () {
	local val="$1" 
	if __zplug::core::sources::is_exists "$val"
	then
		{
			autoload -Uz "$val.zsh"
			eval "$val.zsh"
			unfunction "$val.zsh"
		} 2> >(__zplug::log::capture::error) > /dev/null
	fi
}
__zplug::core::sources::is_exists () {
	local source_name="$1" 
	[[ -f $ZPLUG_ROOT/base/sources/$source_name.zsh ]]
	return $status
}
__zplug::core::sources::is_handler_defined () {
	local subcommand="$1" source_name="$2" handler_name 
	handler_name="__zplug::sources::$source_name::$subcommand" 
	if ! __zplug::core::sources::is_exists "$source_name"
	then
		return $_zplug_status[failure]
	fi
	(( $+functions[$handler_name] ))
	return $status
}
__zplug::core::sources::use_default () {
	local val
	val="$(__zplug::core::core::run_interfaces 'from')" 
	__zplug::core::sources::call "$val"
}
__zplug::core::sources::use_handler () {
	local subcommand="$1" source_name="$2" repo="$3" 
	local handler_name="__zplug::sources::$source_name::$subcommand" 
	if ! __zplug::core::sources::is_handler_defined "$subcommand" "$source_name"
	then
		return $_zplug_status[failure]
	fi
	eval "$handler_name '$repo'"
	return $status
}
__zplug::core::tags::get () {
	__zplug::core::core::get_interfaces "tags" "$argv[@]"
}
__zplug::core::tags::parse () {
	local arg="$1" tag val 
	local -A tags
	local -a pairs
	__zplug::core::tags::get
	tags=("${reply[@]}") 
	pairs=("name" "$arg") 
	for tag in "${(k)tags[@]}"
	do
		val="$(
        __zplug::core::core::run_interfaces \
            "$tag" \
            "$arg"
        )" 
		pairs+=("$tag" "$val") 
	done
	reply=("$pairs[@]") 
}
__zplug::io::file::generate () {
	if [[ -f $ZPLUG_LOADFILE ]]
	then
		return 0
	fi
	command cat <<TEMPLATE > $ZPLUG_LOADFILE
#!/usr/bin/env zsh
# -*- mode: zsh -*-
# vim:ft=zsh
#
# *** ZPLUG EXTERNAL FILE ***
# You can register plugins or commands to zplug on the
# command-line. If you use zplug on the command-line,
# it is possible to write more easily its settings
# by grace of the command-line completion.
# In this case, zplug spit out its settings to
# $ZPLUG_LOADFILE instead of .zshrc.
# If you launch new zsh process, zplug load command
# automatically search this file and run source command.
#
#
# Example:
# zplug "b4b4r07/enhancd", as:plugin, use:"*.sh"
# zplug "rupa/z",          as:plugin, use:"*.sh"
#
TEMPLATE
}
__zplug::io::file::load () {
	if [[ ! -f ${~ZPLUG_LOADFILE} ]]
	then
		__zplug::log::write::info "ZPLUG_LOADFILE is not found"
		return 0
	fi
	source "$ZPLUG_LOADFILE"
	return $status
}
__zplug::io::file::rm_touch () {
	local filepath="${argv:?}" 
	if [[ ! -d ${filepath:h} ]]
	then
		mkdir -p "${filepath:h}"
	fi
	rm -f "$filepath"
	touch "$filepath"
}
__zplug::io::print::die () {
	LC_ALL=POSIX command printf -- "$@" >&2
}
__zplug::io::print::f () {
	local -i lines=0 
	local w pre_format post_format format func
	local -a pre_formats post_formats
	local -a formats texts
	local arg text
	local -i fd=1 
	local is_end=false is_multi=false 
	local is_end_specified=false is_per_specified=false 
	local is_log=false 
	local i
	if (( $argv[(I)--] ))
	then
		is_end_specified=true 
	fi
	if (( $argv[(I)*%*] ))
	then
		is_per_specified=true 
	fi
	while (( $# > 0 ))
	do
		arg="$1" 
		case "$arg" in
			(--put | -1) fd=1  ;;
			(--die | -2) is_log=true 
				fd=2  ;;
			(--func) func="$funcstack[2]" 
				if [[ -n $func ]]
				then
					if [[ $func =~ __$ ]]
					then
						func="${func:gs:_:}" 
					fi
					pre_formats+=("|$em[bold]$func$reset_color|") 
				fi ;;
			(--multi) is_multi=true  ;;
			(--zplug) pre_formats+=("[zplug]")  ;;
			(--warn) pre_formats+=("$fg[red]$em[under]WARNING$reset_color:")  ;;
			(--error) pre_formats+=("$fg[red]ERROR$reset_color:")  ;;
			(--) is_end=true  ;;
			("")  ;;
			(*) if $is_end_specified
				then
					if $is_end
					then
						texts+=("$arg") 
					else
						post_formats+=("$arg") 
					fi
				else
					texts+=("$arg") 
				fi ;;
		esac
		shift
	done
	{
		echo "${pre_formats[*]}" | __zplug::utils::ansi::remove | read pre_format
		repeat $#pre_format
		do
			w="$w " 
		done
		if $is_end_specified
		then
			printf "${post_formats[*]}" | grep -c "" | read lines
			for ((i = 1; i <= $#post_formats; i++ )) do
				if (( $lines == $#post_formats ))
				then
					if ! $is_multi && (( $i > 1 ))
					then
						pre_formats=("$w") 
					fi
				else
					if (( $i > 1 ))
					then
						pre_formats=() 
					fi
				fi
				formats[$i]="${pre_formats[*]} $post_formats[$i]" 
			done
			command printf -- "${(j::)formats[@]}" "${texts[@]}"
		elif $is_per_specified
		then
			command printf -- "${pre_formats[*]:+${pre_formats[*]} }${texts[@]}"
		else
			format="${pre_formats[*]}" 
			printf "${texts[*]}" | grep -c "" | read lines
			for ((i = 1; i <= $#texts; i++ )) do
				if (( $lines == $#texts ))
				then
					if ! $is_multi && (( $i > 1 ))
					then
						format="$w" 
					fi
				else
					if (( $i > 1 ))
					then
						format= 
					fi
				fi
				formats[$i]="${format:+$format }$post_formats[$i]" 
				command printf -- "$formats[$i]$texts[$i]"
			done
		fi
	} >&$fd
	if $is_log
	then
		__zplug::log::write::error "$texts[@]"
	fi
}
__zplug::io::print::put () {
	LC_ALL=POSIX command printf -- "$@"
}
__zplug::job::handle::elapsed_time () {
	local -F elapsed_time="$1" 
	__zplug::utils::ansi::erace_current_line
	builtin printf "\n"
	LC_ALL=POSIX __zplug::io::print::f --zplug "Elapsed time: %.4f sec.\n" $elapsed_time
}
__zplug::job::handle::flock () {
	local -i retry=0 max=15 cant_lock 
	local is_escape=false 
	local -a args
	local file contents
	while (( $#argv > 0 ))
	do
		case "$argv[1]" in
			(--escape) is_escape=true  ;;
			(-* | --*)  ;;
			(*) args+=("$argv[1]")  ;;
		esac
		shift
	done
	if (( $#args < 2 ))
	then
		return 1
	fi
	file="$args[1]" 
	contents="$args[2]" 
	if [[ ! -f $file ]]
	then
		__zplug::log::write::info "create $file because it does not exist"
		touch "$file"
	fi
	(
		until zsystem flock -t 3 "$file"
		do
			cant_lock=$status 
			if (( (++retry) > max ))
			then
				if (( cant_lock > 0 ))
				then
					{
						printf "Can't acquire lock for ${file}."
						if (( cant_lock == 2 ))
						then
							printf " timeout."
						fi
						printf "\n"
					}
					return 1
				fi
				return 1
			fi
		done
		if $is_escape
		then
			print -r "$contents" >>| "$file"
		else
			print "$contents" >>| "$file"
		fi >>| "$file"
	)
}
__zplug::job::handle::hook () {
	local repo="$argv[1]" caller="$argv[2]" 
	local -i timeout=60 
	local message
	case "$caller" in
		(install) message="Installed!"  ;;
		(update) message="Updated!"  ;;
	esac
	if [[ -z $status_codes[$repo] ]]
	then
		status_codes[$repo]="$(__zplug::job::process::get_status_code "$repo" "$caller")" 
	fi
	if [[ $status_codes[$repo] != 0 ]]
	then
		__zplug::job::handle::state "$repo" "$caller"
		proc_states[$repo]="terminated" 
		continue
	fi
	if ! $hook_finished[$repo]
	then
		hook_finished[$repo]=true 
		{
			__zplug::job::hook::build "$repo"
			if (( $status > 0 ))
			then
				builtin printf "$repo\n" >>| "$_zplug_build_log[failure]"
				builtin printf "$repo\n" >>| "$_zplug_build_log[rollback]"
			else
				builtin printf "$repo\n" >>| "$_zplug_build_log[success]"
			fi
		} &
		hook_pids[$repo]=$! 
		{
			touch "$_zplug_lock[job]"
			sleep "$timeout"
			if __zplug::job::process::is_running "$hook_pids[$repo]" && ! __zplug::job::process::is_running "$repo_pids[@]"
			then
				__zplug::job::process::kill "$hook_pids[$repo]"
				builtin printf "$repo\n" >>| "$_zplug_build_log[timeout]"
				builtin printf "$repo\n" >>| "$_zplug_build_log[rollback]"
			fi
			rm -f "$_zplug_lock[job]"
		} &
	fi
	__zplug::utils::ansi::erace_current_line
	if __zplug::job::process::is_running "$hook_pids[$repo]"
	then
		__zplug::job::message::green "$repo" "$message" "$spinners[$spinner_idx]" "$sub_spinners[$sub_spinner_idx]"
	else
		if __zplug::job::hook::build_failure "$repo"
		then
			__zplug::job::message::green "$repo" "$message" "" "failure"
		elif __zplug::job::hook::build_timeout "$repo"
		then
			__zplug::job::message::green "$repo" "$message" "" "timeout"
		else
			__zplug::job::message::green "$repo" "$message" "" "success"
		fi
		proc_states[$repo]="terminated" 
	fi
}
__zplug::job::handle::running () {
	local repo="$argv[1]" caller="$argv[2]" 
	local message
	case "$caller" in
		(install) message="Installing..."  ;;
		(update) message="Updating..."  ;;
		(status) message="Fetching..."  ;;
	esac
	__zplug::job::message::spinning "$repo" "$message" "$spinners[$spinner_idx]"
}
__zplug::job::handle::state () {
	local repo="$argv[1]" caller="$argv[2]" 
	local message
	if [[ -z $status_codes[$repo] ]]
	then
		status_codes[$repo]="$(__zplug::job::process::get_status_code "$repo" "$caller")" 
	fi
	case $status_codes[$repo] in
		($_zplug_status[success]) case "$caller" in
				(install) message="Installed!"  ;;
				(update) message="Updated!"  ;;
			esac
			__zplug::job::message::green "$repo" "$message" ;;
		($_zplug_status[up_to_date]) __zplug::job::message::white "$repo" "Up-to-date" ;;
		($_zplug_status[skip_local]) __zplug::job::message::yellow "$repo" "Skip local repo" ;;
		($_zplug_status[skip_frozen]) __zplug::job::message::yellow "$repo" "Skip frozen repo" ;;
		($_zplug_status[skip_if]) __zplug::job::message::yellow "$repo" "Skip due to if" ;;
		($_zplug_status[revision_lock]) __zplug::job::message::yellow "$repo" "Revision locked" ;;
		($_zplug_status[failure]) __zplug::job::message::red "$repo" "Failed to $caller" ;;
		($_zplug_status[out_of_date]) __zplug::job::message::red "$repo" "Local out of date" ;;
		($_zplug_status[not_on_branch]) __zplug::job::message::red "$repo" "Not on any branch" ;;
		($_zplug_status[not_git_repo]) __zplug::job::message::red "$repo" "Not git repo" ;;
		($_zplug_status[repo_not_found]) __zplug::job::message::red "$repo" "Repo not found" ;;
		($_zplug_status[unknown] | *) __zplug::job::message::red "$repo" "Unknown error" ;;
	esac
}
__zplug::job::handle::wait () {
	local caller="${${(M)funcstack[@]:#__*__}:gs:_:}" 
	local -i screen_size=$(($#repo_pids + 2)) 
	local -i spinner_idx=1 sub_spinner_idx=1 
	local -a spinners sub_spinners
	local -F latency=0.1 
	spinners=(⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏) 
	sub_spinners=(⠁ ⠁ ⠉ ⠙ ⠚ ⠒ ⠂ ⠂ ⠒ ⠲ ⠴ ⠤ ⠄ ⠄ ⠤ ⠠ ⠠ ⠤ ⠦ ⠖ ⠒ ⠐ ⠐ ⠒ ⠓ ⠋ ⠉ ⠈ ⠈) 
	if __zplug::job::queue::is_overflow || __zplug::job::queue::is_within_range
	then
		repeat $screen_size
		do
			builtin printf "\n"
		done
		while __zplug::job::process::is_running "$repo_pids[@]" "$hook_pids[@]" || (( ${(k)#proc_states[(R)running]} > 0 ))
		do
			sleep "$latency"
			__zplug::utils::ansi::cursor_up $screen_size
			if (( ( spinner_idx+=1 ) > $#spinners ))
			then
				spinner_idx=1 
			fi
			if (( ( sub_spinner_idx+=1 ) > $#sub_spinners ))
			then
				sub_spinner_idx=1 
			fi
			for repo in "${(k)repo_pids[@]}"
			do
				if __zplug::job::process::is_running "$repo_pids[$repo]"
				then
					__zplug::job::handle::running "$repo" "$caller"
					proc_states[$repo]="running" 
				else
					if [[ -n $hook_build[$repo] ]]
					then
						__zplug::job::handle::hook "$repo" "$caller"
					else
						__zplug::job::handle::state "$repo" "$caller"
						proc_states[$repo]="terminated" 
					fi
				fi
			done
			__zplug::utils::ansi::erace_current_line
			if __zplug::job::process::is_running "$repo_pids[@]" "$hook_pids[@]"
			then
				builtin printf "\n"
				__zplug::io::print::f "Finished: %d/%d plugins\n" ${(k)#proc_states[(R)terminated]} ${#proc_states}
			else
				repo_pids=() 
			fi
		done
	fi
}
__zplug::job::hook::build () {
	local repo="$1" 
	__zplug::job::hook::service "$repo" "hook-build"
	return $status
}
__zplug::job::hook::build_failure () {
	local repo="$1" 
	[[ -f $_zplug_build_log[failure] ]] && grep -x "$repo" "$_zplug_build_log[failure]" &> /dev/null
	return $status
}
__zplug::job::hook::build_timeout () {
	local repo="$1" 
	[[ -f $_zplug_build_log[timeout] ]] && grep -x "$repo" "$_zplug_build_log[timeout]" &> /dev/null
	return $status
}
__zplug::job::hook::load () {
	local repo="$1" 
	__zplug::job::hook::service "$repo" "hook-load"
	return $status
}
__zplug::job::hook::service () {
	local repo="$1" hook="$2" 
	local -A tags
	__zplug::core::tags::parse "$repo"
	tags=("${reply[@]}") 
	if (( ! $+tags[$hook] ))
	then
		__zplug::io::print::f --die --zplug "'%s' is not defined as a hook (%s)\n" "$hook" "$fg[green]$repo$reset_color"
		return 1
	fi
	if [[ -n $tags[$hook] ]]
	then
		(
			__zplug::utils::shell::cd "$tags[dir]"
			alias sudo=__zplug::utils::shell::sudo
			eval "$tags[$hook]" 2> >(__zplug::log::capture::error) > >(__zplug::log::capture::debug)
			return $status
		)
	fi
}
__zplug::job::message::green () {
	local repo="$1" message="$2" spinner="$3" hook="$4" 
	local color=white 
	case "$hook" in
		(success) color=green  ;;
		(failure) color=red  ;;
		(timeout) color=yellow  ;;
		(cancel) color=red  ;;
	esac
	builtin printf " $fg_bold[white]${spinner:-\U2714}$reset_color  $fg[green]%s$reset_color  %s" ${(r,20,):-"$message"} "$repo"
	if [[ -n $hook ]]
	then
		builtin printf " --> hook-build: $fg[$color]%s$reset_color\n" "$hook"
	else
		builtin printf "\n"
	fi
}
__zplug::job::message::red () {
	local repo="$1" message="$2" 
	builtin printf " $fg_bold[red]\U2718$reset_color  $fg[red]%s$reset_color  %s\n" ${(r,20,):-"$message"} "$repo"
}
__zplug::job::message::spinning () {
	local repo="$1" message="$2" spinner="$3" 
	builtin printf " $fg[white]%s$reset_color  %s  %s\n" "$spinner" ${(r,20,):-"$message"} "$repo"
}
__zplug::job::message::white () {
	local repo="$1" message="$2" 
	builtin printf " $fg[white]\U2714$reset_color  %s  %s\n" ${(r,20,):-"$message"} "$repo"
}
__zplug::job::message::yellow () {
	local repo="$1" message="$2" 
	builtin printf " $fg_bold[yellow]\U279C$reset_color  $fg[yellow]%s$reset_color  %s\n" ${(r,20,):-"$message"} "$repo"
}
__zplug::job::parallel::deinit () {
	local caller="${${(M)funcstack[@]:#__*__}:gs:_:}" 
	case "$caller" in
		(update) if (( ${(k)#status_codes[(R)$_zplug_status[failure]]} == 0 ))
			then
				builtin printf "$fg_bold[default] ==> Updating finished successfully!$reset_color\n"
			else
				builtin printf "$fg_bold[red] ==> Updating failed for following packages:$reset_color\n"
				for repo in "${(k)status_codes[@]}"
				do
					if [[ $status_codes[$repo] == $_zplug_status[failure] ]]
					then
						builtin printf " - %s\n" "$repo"
					fi
				done
			fi
			__zplug::job::rollback::message
			status_ok=(${(@f)"$(command cat "$_zplug_log[update]" 2>/dev/null \
                | __zplug::utils::awk::ltsv 'key("status")==0')"}) 
			if (( $#status_ok > 0 ))
			then
				__zplug::core::core::run_interfaces 'clear'
			fi ;;
		(install) if (( ${(k)#status_codes[(R)$_zplug_status[failure]]} == 0 ))
			then
				builtin printf "$fg_bold[default] ==> Installation finished successfully!$reset_color\n"
			else
				builtin printf "$fg_bold[red] ==> Installation failed for following packages:$reset_color\n"
				for repo in "${(k)status_codes[@]}"
				do
					if [[ $status_codes[$repo] == $_zplug_status[failure] ]]
					then
						builtin printf " - %s\n" "$repo"
					fi
				done
			fi
			__zplug::job::rollback::message
			status_ok=(${(@f)"$(command cat "$_zplug_log[install]" 2>/dev/null \
                | __zplug::utils::awk::ltsv 'key("status")==0')"}) 
			if (( $#status_ok > 0 ))
			then
				__zplug::core::core::run_interfaces 'clear'
			fi ;;
		(status) if (( ${(k)#status_codes[(R)$_zplug_status[out_of_date]]} == 0 ))
			then
				builtin printf "$fg_bold[default] ==> All packages are up-to-date!$reset_color\n"
			else
				builtin printf "$fg_bold[red] ==> Run 'zplug update'. These packages are local out of date:$reset_color\n"
				for repo in "${(k)status_codes[@]}"
				do
					if [[ $status_codes[$repo] == $_zplug_status[out_of_date] ]]
					then
						builtin printf " - %s\n" "$repo"
					fi
				done
			fi ;;
	esac
	tput cnorm
}
__zplug::job::parallel::init () {
	local caller="${${(M)funcstack[@]:#__*__}:gs:_:}" 
	local is_parallel=false is_select=false 
	local filter repo starting_message
	local -aU repos status_ok
	repos=("$argv[@]") 
	case "$caller" in
		(install) starting_message="install" 
			if (( $#repos == 0 ))
			then
				repos=($(__zplug::core::core::run_interfaces 'check' '--debug')) 
				if (( $#repos == 0 ))
				then
					__zplug::io::print::f --zplug --die "no packages to install\n"
					return 1
				fi
			fi
			rm -f "$_zplug_build_log[success]" "$_zplug_build_log[failure]" "$_zplug_build_log[timeout]" "$_zplug_log[install]"
			touch "$_zplug_log[install]" ;;
		(update) starting_message="update" 
			zstyle -s ':zplug:core:update' 'select' is_select
			zstyle ':zplug:core:update' 'select' no
			rm -f "$_zplug_build_log[success]" "$_zplug_build_log[failure]" "$_zplug_build_log[timeout]" "$_zplug_log[update]"
			touch "$_zplug_log[update]" ;;
		(status) starting_message="get remote status" 
			zstyle -s ':zplug:core:status' 'select' is_select
			zstyle ':zplug:core:status' 'select' no
			rm -f "$_zplug_log[status]"
			touch "$_zplug_log[status]" ;;
		(*) return 1 ;;
	esac
	if (( $_zplug_boolean_true[(I)$is_select] ))
	then
		filter="$(
        __zplug::utils::shell::search_commands \
            "$ZPLUG_FILTER"
        )" 
		if [[ -z $filter ]]
		then
			__zplug::io::print::f --die --zplug --error --func "There is no available filter in ZPLUG_FILTER\n"
			return 1
		fi
		repos+=(${(@f)"$(echo "${(Fk)zplugs[@]}" | eval "$filter")"}) 
		if (( $#repos == 0 ))
		then
			return 1
		fi
	fi
	if (( $#repos == 0 ))
	then
		repos=("${(k)zplugs[@]:gs:@::}") 
	fi
	if (( $#repos > 1 ))
	then
		is_parallel=true 
	fi
	for repo in "${repos[@]}"
	do
		if ! __zplug::base::base::zpluged "$repo"
		then
			__zplug::io::print::f --die --zplug "$repo: no such package\n"
			return 1
		fi
	done
	setopt nonotify nomonitor
	tput civis
	__zplug::io::print::f --zplug "Start to %s %d plugin${is_parallel:+"s"} %s\n\n" "$starting_message" $#repos "${is_parallel:+"in parallel"}"
	reply=("$repos[@]") 
}
__zplug::job::polling::periodic () {
	if [[ -f $_zplug_lock[job] ]]
	then
		setopt nomonitor
	else
		if [[ -o monitor ]]
		then
			return 0
		fi
		if setopt monitor
		then
			__zplug::log::write::info "turn monitor on"
		fi
	fi
}
__zplug::job::process::get_status_code () {
	local repo="${1:?}" target="${2:?}" 
	if [[ ! -f $_zplug_log[$target] ]]
	then
		return 1
	fi
	command cat "$_zplug_log[$target]" | __zplug::utils::awk::ltsv 'key("repo")=="'"$repo"'"{print key("status")}'
	return $status
}
__zplug::job::process::is_running () {
	local job
	for job in "$argv[@]"
	do
		[[ $job == "" ]] && return 1
		if kill -0 "$job" &> /dev/null
		then
			return 0
		fi
	done
	return 1
}
__zplug::job::process::kill () {
	local pid="${1:?}" 
	if ! __zplug::job::process::is_running "$pid"
	then
		return $status
	fi
	kill -9 $pid &> /dev/null
	return $status
}
__zplug::job::queue::is_overflow () {
	local -i queue_max=$ZPLUG_THREADS 
	if (( $#repos >= $queue_max ))
	then
		if (( $#repo_pids >= $queue_max )) || (( $#status_codes == $#repos ))
		then
			return 0
		fi
	fi
	return 1
}
__zplug::job::queue::is_within_range () {
	local -i queue_max=$ZPLUG_THREADS 
	if (( $#repos < $queue_max )) && (( $#repo_pids == $#repos ))
	then
		return 0
	fi
	return 1
}
__zplug::job::rollback::build () {
	local repo
	local -a failed
	if [[ ! -f $_zplug_build_log[rollback] ]] || [[ ! -s $_zplug_build_log[rollback] ]]
	then
		__zplug::io::print::f --die --zplug "There is no package which have to be rollbacked.\n"
		return 1
	fi
	tput civis
	while read repo
	do
		if [[ -z $repo ]]
		then
			continue
		fi
		printf "$fg_bold[default]%s$reset_color %s\n" ${(r,20,):-"Building..."} "$repo"
		__zplug::utils::ansi::cursor_up 1
		__zplug::job::hook::build "$repo"
		if (( $status > 0 ))
		then
			failed+=("$repo") 
			printf "$fg[red]%s$reset_color %s\n" ${(r,20,):-"Failed to build!"} "$repo"
		else
			printf "$fg[green]%s$reset_color %s\n" ${(r,20,):-"Built successfully!"} "$repo"
		fi
	done < "$_zplug_build_log[rollback]"
	tput cnorm
	if (( $#failed == 0 ))
	then
		rm -f "$_zplug_build_log[rollback]"
		return 0
	fi
	printf "%s\n" "$failed[@]" >| "$_zplug_build_log[rollback]"
	printf "Run '$fg_bold[default]zplug --log$reset_color' if you find cause of the failure of these build\n"
}
__zplug::job::rollback::message () {
	if [[ -s $_zplug_build_log[rollback] ]]
	then
		if [[ -f $_zplug_build_log[failure] ]] || [[ -f $_zplug_build_log[timeout] ]]
		then
			__zplug::io::print::f --zplug "$fg_bold[red]These hook-build were failed to run:$reset_color\n"
			{
				sed 's/^/ - /g' "$_zplug_build_log[failure]"
				sed 's/^/ - /g' "$_zplug_build_log[timeout]"
			} 2> /dev/null
			__zplug::io::print::f --zplug "To retry these hook-build, please run '$fg_bold[default]%s$reset_color'.\n" "zplug --rollback=build"
		fi
	fi
}
__zplug::log::capture::debug () {
	local message="$(<&0)" 
	if [[ -z $message ]]
	then
		return 0
	fi
	__zplug::job::handle::flock --escape "$_zplug_log[trace]" "$(__zplug::log::format::with_json "DEBUG" "$message")"
}
__zplug::log::capture::error () {
	local message="$(<&0)" 
	if [[ -z $message ]]
	then
		return 0
	fi
	__zplug::job::handle::flock --escape "$_zplug_log[trace]" "$(__zplug::log::format::with_json "ERROR" "$message")"
}
__zplug::log::capture::info () {
	local message="$(<&0)" 
	if [[ -z $message ]]
	then
		return 0
	fi
	__zplug::job::handle::flock --escape "$_zplug_log[trace]" "$(__zplug::log::format::with_json "INFO" "$message")"
}
__zplug::log::format::with_json () {
	local -i i=1 
	local level="${1:-"INFO"}" message="$2" 
	local is_message_json=false 
	builtin printf '{'
	builtin printf '"pid":%d,' "$$"
	builtin printf '"shlvl":%d,' "$SHLVL"
	builtin printf '"level":"%s",' "$level"
	builtin printf '"dir":"%s",' "$PWD"
	builtin printf '"message":'
	if $is_message_json
	then
		builtin printf "$message"
	else
		builtin printf "$message" | __zplug::utils::ansi::remove | __zplug::utils::shell::json_escape | tr -d '\n'
	fi
	builtin printf ','
	builtin printf '"trace":['
	for ((i = 1; i < $#functrace; i++)) do
		builtin printf '"%s",' "$functrace[$i]"
	done
	builtin printf '"%s"' "$functrace[$#functrace]"
	builtin printf "],"
	builtin printf '"date":"%s"' "$(strftime "%FT%T%z" $EPOCHSECONDS)"
	builtin printf "}\n"
}
__zplug::log::print::debug () {
	__zplug::log::format::with_json --level "DEBUG" --message "$argv[1]" "$argv[2,-1]"
}
__zplug::log::print::error () {
	__zplug::log::format::with_json --level "ERROR" --message "$argv[1]" "$argv[2,-1]"
}
__zplug::log::print::info () {
	__zplug::log::format::with_json --level "INFO" --message "$argv[1]" "$argv[2,-1]"
}
__zplug::log::write::debug () {
	__zplug::job::handle::flock --escape "$_zplug_log[trace]" "$(__zplug::log::format::with_json "DEBUG" "$argv[@]")"
}
__zplug::log::write::error () {
	__zplug::job::handle::flock --escape "$_zplug_log[trace]" "$(__zplug::log::format::with_json "ERROR" "$argv[@]")"
}
__zplug::log::write::info () {
	__zplug::job::handle::flock --escape "$_zplug_log[trace]" "$(__zplug::log::format::with_json "INFO" "$argv[@]")"
}
__zplug::sources::bitbucket::check () {
	__zplug::sources::github::check "$argv[@]"
}
__zplug::sources::bitbucket::get_url () {
	local repo="$1" url_format 
	case "$ZPLUG_PROTOCOL" in
		(HTTPS | https) url_format="https://git::@bitbucket.org/${repo}.git"  ;;
		(SSH | ssh) url_format="git@bitbucket.org:${repo}.git"  ;;
	esac
	echo "$url_format"
}
__zplug::sources::bitbucket::install () {
	__zplug::sources::github::install "$argv[@]"
}
__zplug::sources::bitbucket::load_command () {
	__zplug::sources::github::load_command "$argv[@]"
}
__zplug::sources::bitbucket::load_plugin () {
	__zplug::sources::github::load_plugin "$argv[@]"
}
__zplug::sources::bitbucket::load_theme () {
	__zplug::sources::github::load_theme "$argv[@]"
}
__zplug::sources::bitbucket::update () {
	__zplug::sources::github::update "$argv[@]"
}
__zplug::sources::gh-r::check () {
	local repo="$1" 
	local -A tags
	tags[dir]="$(
    __zplug::core::core::run_interfaces \
        'dir' \
        "$repo"
    )" 
	if [[ ! -d $tags[dir] ]] && [[ ! -f $tags[dir]/INDEX ]]
	then
		return 1
	fi
	return 0
}
__zplug::sources::gh-r::install () {
	local repo="$1" url 
	url="$(
    __zplug::utils::releases::get_url \
        "$repo"
    )" 
	__zplug::utils::releases::get "$url"
	return $status
}
__zplug::sources::gh-r::load_command () {
	__zplug::sources::github::load_command "$argv[@]"
}
__zplug::sources::gh-r::update () {
	local repo="$1" index url 
	local -A tags
	tags[dir]="$(__zplug::core::core::run_interfaces 'dir' "$repo")" 
	tags[use]="$(__zplug::core::core::run_interfaces 'use' "$repo")" 
	tags[at]="$(__zplug::core::core::run_interfaces 'at' "$repo")" 
	__zplug::utils::shell::cd "$tags[dir]" || return $_zplug_status[repo_not_found]
	url="$(
    __zplug::utils::releases::get_url \
        "$repo"
    )" 
	if [[ -d $tags[dir] ]]
	then
		if [[ -f $tags[dir]/INDEX ]]
		then
			index="$(command cat "$tags[dir]/INDEX" 2>/dev/null)" 
			if [[ $tags[at] == "latest" ]]
			then
				if grep -q "$index" <<< "$url"
				then
					return $_zplug_status[up_to_date]
				else
					__zplug::sources::gh-r::install "$repo"
					return $status
				fi
			else
				return $_zplug_status[up_to_date]
			fi
		fi
	else
		return $_zplug_status[repo_not_found]
	fi
	return $_zplug_status[success]
}
__zplug::sources::gist::check () {
	__zplug::sources::github::check "$argv[@]"
}
__zplug::sources::gist::get_url () {
	local repo="$1" url_format 
	case "$ZPLUG_PROTOCOL" in
		(HTTPS | https) url_format="https://git::@gist.github.com/${repo}.git" 
			if __zplug::base::base::git_version 2.3
			then
				export GIT_TERMINAL_PROMPT=0 
				url_format="https://gist.github.com/${repo}.git" 
			fi ;;
		(SSH | ssh) url_format="git@gist.github.com:${repo}.git"  ;;
	esac
	echo "$url_format"
}
__zplug::sources::gist::install () {
	__zplug::sources::github::install "$argv[@]"
}
__zplug::sources::gist::load_command () {
	__zplug::sources::github::load_command "$@"
}
__zplug::sources::gist::load_plugin () {
	__zplug::sources::github::load_plugin "$@"
}
__zplug::sources::gist::load_theme () {
	__zplug::sources::github::load_theme "$argv[@]"
}
__zplug::sources::gist::update () {
	__zplug::sources::github::update "$argv[@]"
}
__zplug::sources::github::check () {
	local repo="$1" 
	local -A tags
	tags[dir]="$(
    __zplug::core::core::run_interfaces \
        'dir' \
        "$repo"
    )" 
	[[ -d $tags[dir] ]]
	return $status
}
__zplug::sources::github::get_url () {
	local repo="$1" url_format 
	case "$ZPLUG_PROTOCOL" in
		(HTTPS | https) url_format="https://git::@github.com/${repo}.git" 
			if __zplug::base::base::git_version 2.3
			then
				export GIT_TERMINAL_PROMPT=0 
				url_format="https://github.com/${repo}.git" 
			fi ;;
		(SSH | ssh) url_format="git@github.com:${repo}.git"  ;;
	esac
	echo "$url_format"
}
__zplug::sources::github::install () {
	local repo="$1" 
	__zplug::utils::git::clone "$repo"
	return $status
}
__zplug::sources::github::load_command () {
	local repo="${1:?}" 
	local -A tags default_tags
	local src dst
	local -a sources
	local -a load_fpaths load_commands
	local -A rename_hash
	__zplug::core::tags::parse "$repo"
	tags=("${reply[@]}") 
	default_tags[use]="$(__zplug::core::core::run_interfaces 'use')" 
	tags[dir]="${tags[dir]%/}" 
	load_commands=() 
	load_fpaths=() 
	if [[ $tags[use] == *(*)* && $tags[rename-to] == *\$* ]]
	then
		if (( $#rename_hash == 0 )) && [[ -n $tags[rename-to] ]]
		then
			rename_hash=($(__zplug::utils::shell::zglob \
                "$tags[dir]/$tags[use]" \
                "$ZPLUG_BIN/$tags[rename-to]")) 
		fi
	else
		if [[ $tags[use] == $default_tags[use] ]]
		then
			if [[ -f $tags[dir]/${repo:t} ]]
			then
				sources=("$tags[dir]/${repo:t}"(N-.)) 
			fi
		else
			if [[ $tags[use] == $default_tags[use] || $tags[from] == "gh-r" ]]
			then
				tags[use]="*(N-*)" 
			fi
			sources=(${(@f)"$( \
                __zplug::utils::shell::expand_glob "$tags[dir]/$tags[use]" "(N-.)"
            )"}) 
		fi
		dst=${${tags[rename-to]:+$ZPLUG_BIN/$tags[rename-to]}:-"$ZPLUG_BIN"} 
		for src in "$sources[@]"
		do
			chmod 755 "$src"
			rename_hash+=("$src" "$dst") 
		done
	fi
	for src in "${(k)rename_hash[@]}"
	do
		load_commands+=("$src\0$rename_hash[$src]") 
	done
	if (( $#rename_hash == 0 ))
	then
		__zplug::log::write::info "$repo: no matches found, rename_hash is empty"
	fi
	load_fpaths+=("$tags[dir]"/{_*,/**/_*}(N-.:h)) 
	reply=() 
	[[ -n $load_fpaths ]] && reply+=("load_fpaths" "${(F)load_fpaths}") 
	[[ -n $load_commands ]] && reply+=("load_commands" "${(F)load_commands}") 
	[[ -n $tags[hook-load] ]] && reply+=("hook_load" "$tags[name]\0$tags[hook-load]") 
	return 0
}
__zplug::sources::github::load_plugin () {
	local repo="${1:?}" 
	local -A tags default_tags
	local -a unclassified_plugins load_fpaths defer_1_plugins defer_2_plugins defer_3_plugins load_plugins lazy_plugins
	__zplug::core::tags::parse "$repo"
	tags=("${reply[@]}") 
	default_tags[use]="$(__zplug::core::core::run_interfaces 'use')" 
	load_fpaths=() 
	if (( $_zplug_boolean_true[(I)$tags[lazy]] ))
	then
		if [[ $tags[use] == $default_tags[use] ]]
		then
			unclassified_plugins+=("$tags[dir]"/${repo:t}(N.) "$tags[dir]/autoload"/*(N.) "$tags[dir]/functions"/*(N.)) 
			load_fpaths+=("$tags[dir]"(N/) "$tags[dir]/autoload"(N/) "$tags[dir]/functions"(N/)) 
		else
			unclassified_plugins+=(${(@f)"$( \
                __zplug::utils::shell::expand_glob "$tags[dir]/$tags[use]" "(N-.)"
            )"}) 
			load_fpaths+=($unclassified_plugins:h(N/)) 
		fi
	else
		if [[ $tags[use] == $default_tags[use] ]]
		then
			unclassified_plugins+=("$tags[dir]"/*.plugin.zsh(N-.)) 
		fi
		if (( $#unclassified_plugins == 0 ))
		then
			unclassified_plugins+=(${(@f)"$( \
                __zplug::utils::shell::expand_glob "$tags[dir]/$tags[use]" "(N-.)"
            )"}) 
			if (( $#unclassified_plugins == 0 ))
			then
				unclassified_plugins+=(${(@f)"$( \
                    __zplug::utils::shell::expand_glob "$tags[dir]/$tags[use]/$default_tags[use]" "(N-.)"
                )"}) 
				load_fpaths+=("$tags[dir]/$tags[use]"/_*(N.:h)) 
			fi
		fi
		load_fpaths+=("$tags[dir]"/_*(N.:h)) 
	fi
	case "$tags[defer]" in
		(0) if (( $_zplug_boolean_true[(I)$tags[lazy]] ))
			then
				lazy_plugins+=("${unclassified_plugins[@]}") 
			else
				load_plugins+=("${unclassified_plugins[@]}") 
			fi ;;
		(1) defer_1_plugins+=("${unclassified_plugins[@]}")  ;;
		(2) defer_2_plugins+=("${unclassified_plugins[@]}")  ;;
		(3) defer_3_plugins+=("${unclassified_plugins[@]}")  ;;
		(*) : ;;
	esac
	unclassified_plugins=() 
	if [[ -n $tags[ignore] ]]
	then
		ignore_patterns=($(
        zsh -c "$_ZPLUG_CONFIG_SUBSHELL; echo ${tags[dir]}/${~tags[ignore]}" \
            2> >(__zplug::log::capture::error)
        )(N)) 
		for ignore in "${ignore_patterns[@]}"
		do
			if [[ -n $load_commands[(i)$ignore] ]]
			then
				unset "load_commands[$ignore]"
			fi
			load_plugins=("${(R)load_plugins[@]:#$ignore}") 
			defer_1_plugins=("${(R)defer_1_plugins[@]:#$ignore}") 
			defer_2_plugins=("${(R)defer_2_plugins[@]:#$ignore}") 
			defer_3_plugins=("${(R)defer_3_plugins[@]:#$ignore}") 
			lazy_plugins=("${(R)lazy_plugins[@]:#$ignore}") 
			load_fpaths=("${(R)load_fpaths[@]:#$ignore}") 
		done
	fi
	reply=() 
	[[ -n $load_plugins ]] && reply+=("load_plugins" "${(F)load_plugins}") 
	[[ -n $defer_1_plugins ]] && reply+=("defer_1_plugins" "${(F)defer_1_plugins}") 
	[[ -n $defer_2_plugins ]] && reply+=("defer_2_plugins" "${(F)defer_2_plugins}") 
	[[ -n $defer_3_plugins ]] && reply+=("defer_3_plugins" "${(F)defer_3_plugins}") 
	[[ -n $lazy_plugins ]] && reply+=("lazy_plugins" "${(F)lazy_plugins}") 
	[[ -n $load_fpaths ]] && reply+=("load_fpaths" "${(F)load_fpaths}") 
	[[ -n $tags[hook-load] ]] && reply+=("hook_load" "$tags[name]\0$tags[hook-load]") 
}
__zplug::sources::github::load_theme () {
	local repo="${1:?}" 
	local -A tags default_tags
	local -a themes_ext
	local -a load_themes load_fpaths
	__zplug::core::tags::parse "$repo"
	tags=("${reply[@]}") 
	themes_ext=("zsh-theme" "theme-zsh") 
	load_themes=() 
	load_fpaths=() 
	if [[ -n $tags[use] ]]
	then
		load_themes=(${(@f)"$( \
            __zplug::utils::shell::expand_glob "$tags[dir]/$tags[use]" "(N-.)"
        )"}) 
		if (( $#load_themes == 0 ))
		then
			load_themes=(${(@f)"$( \
                __zplug::utils::shell::expand_glob "$tags[dir]/$tags[use]/*.${^themes_ext}" "(N-.)"
            )"}) 
		fi
	else
		load_themes+=("$tags[dir]"/*.${^themes_ext}(N-.)) 
	fi
	load_fpaths+=("$tags[dir]"/_*(N.:h)) 
	reply=() 
	[[ -n $load_themes ]] && reply+=("load_themes" "${(F)load_themes}") 
	[[ -n $load_fpaths ]] && reply+=("load_fpaths" "${(F)load_fpaths}") 
	[[ -n $tags[hook-load] ]] && reply+=("hook_load" "$tags[name]\0$tags[hook-load]") 
}
__zplug::sources::github::update () {
	local repo="$1" 
	local rev_local rev_remote rev_base
	local -A tags
	tags[dir]="$(__zplug::core::core::run_interfaces 'dir' "$repo")" 
	tags[at]="$(__zplug::core::core::run_interfaces 'at' "$repo")" 
	__zplug::utils::git::merge --dir "$tags[dir]" --branch "$tags[at]" --repo "$repo"
	return $status
}
__zplug::sources::gitlab::check () {
	__zplug::sources::github::check "$argv[@]"
}
__zplug::sources::gitlab::get_url () {
	local repo="$1" url_format 
	case "$ZPLUG_PROTOCOL" in
		(HTTPS | https) url_format="https://git::@gitlab.com/${repo}.git"  ;;
		(SSH | ssh) url_format="git@gitlab.com:${repo}.git"  ;;
	esac
	echo "$url_format"
}
__zplug::sources::gitlab::install () {
	__zplug::sources::github::install "$argv[@]"
}
__zplug::sources::gitlab::load_command () {
	__zplug::sources::github::load_command "$argv[@]"
}
__zplug::sources::gitlab::load_plugin () {
	__zplug::sources::github::load_plugin "$argv[@]"
}
__zplug::sources::gitlab::load_theme () {
	__zplug::sources::github::load_theme "$argv[@]"
}
__zplug::sources::gitlab::update () {
	__zplug::sources::github::update "$argv[@]"
}
__zplug::sources::local::check () {
	local repo="$1" 
	local -A tags
	local expanded_path
	local -a expanded_paths
	__zplug::core::tags::parse "$repo"
	tags=("${reply[@]}") 
	expanded_paths=(${(@f)"$( \
        __zplug::utils::shell::expand_glob "$tags[dir]"
    )"}) 
	for expanded_path in ${expanded_paths[@]}
	do
		if [[ -e $expanded_path ]]
		then
			return 0
		fi
	done
	__zplug::log::write::error "no matching file or directory in $tags[dir]"
	return 1
}
__zplug::sources::local::load_command () {
	__zplug::sources::github::load_command "$argv[@]"
}
__zplug::sources::local::load_plugin () {
	__zplug::sources::github::load_plugin "$argv[@]"
}
__zplug::sources::local::load_theme () {
	__zplug::sources::github::load_theme "$argv[@]"
}
__zplug::sources::oh-my-zsh::check () {
	local repo="$1" 
	local -A tags
	tags[dir]="$(
    __zplug::core::core::run_interfaces \
        'dir' \
        "$repo"
    )" 
	[[ -n $tags[dir] ]] && [[ -d $tags[dir] ]]
	return $status
}
__zplug::sources::oh-my-zsh::get_url () {
	__zplug::sources::github::get_url "$_ZPLUG_OHMYZSH"
}
__zplug::sources::oh-my-zsh::install () {
	local repo="$1" 
	if __zplug::sources::oh-my-zsh::check "$repo"
	then
		return 0
	fi
	__zplug::utils::git::clone "$_ZPLUG_OHMYZSH"
	return $status
}
__zplug::sources::oh-my-zsh::load_plugin () {
	local repo="${1:?}" 
	local -A tags default_tags
	local -a unclassified_plugins load_fpaths load_plugins lazy_plugins defer_1_plugins defer_2_plugins defer_3_plugins load_themes
	local -a themes_ext
	__zplug::core::tags::parse "$repo"
	tags=("${reply[@]}") 
	default_tags[use]="$(__zplug::core::core::run_interfaces 'use')" 
	unclassified_plugins=() 
	load_fpaths=() 
	load_plugins=() 
	lazy_plugins=() 
	defer_1_plugins=() 
	defer_2_plugins=() 
	defer_3_plugins=() 
	load_themes=() 
	themes_ext=("zsh-theme" "theme-zsh") 
	case "$repo" in
		(plugins/*) unclassified_plugins=(${(@f)"$(__zplug::utils::omz::depends "$tags[name]")"}) 
			if [[ $tags[use] == $default_tags[use] ]]
			then
				unclassified_plugins+=(${(@f)"$( \
                    __zplug::utils::shell::expand_glob "$tags[dir]/$tags[name]/*.plugin.zsh" "(N-.)"
                )"}) 
			else
				unclassified_plugins+=(${(@f)"$( \
                    __zplug::utils::shell::expand_glob "$tags[dir]/$tags[name]/$tags[use]" "(N-.)"
                )"}) 
			fi ;;
		(themes/*) unclassified_plugins=(${(@f)"$(__zplug::utils::omz::depends "$tags[name]")"}) 
			load_themes=(${(@f)"$( \
                    __zplug::utils::shell::expand_glob "$tags[dir]/$tags[name].${^themes_ext}" "(N-.)"
                )"})  ;;
		(lib/*) unclassified_plugins+=(${(@f)"$( \
                __zplug::utils::shell::expand_glob "$tags[dir]/$tags[name].zsh" "(N-.)"
            )"})  ;;
	esac
	load_fpaths+=("$tags[dir]/$tags[name]"/{_*,**/_*}(N-.:h)) 
	case "$tags[defer]" in
		(0) if (( $_zplug_boolean_true[(I)$tags[lazy]] ))
			then
				lazy_plugins+=("${unclassified_plugins[@]}") 
			else
				load_plugins+=("${unclassified_plugins[@]}") 
			fi ;;
		(1) defer_1_plugins+=("${unclassified_plugins[@]}")  ;;
		(2) defer_2_plugins+=("${unclassified_plugins[@]}")  ;;
		(3) defer_3_plugins+=("${unclassified_plugins[@]}")  ;;
		(*) : ;;
	esac
	unclassified_plugins=() 
	if [[ -n $tags[ignore] ]]
	then
		ignore_patterns=($(
        zsh -c "$_ZPLUG_CONFIG_SUBSHELL; echo ${tags[dir]}/${~tags[ignore]}" \
            2> >(__zplug::log::capture::error)
        )(N)) 
		for ignore in "${ignore_patterns[@]}"
		do
			if [[ -n $load_commands[(i)$ignore] ]]
			then
				unset "load_commands[$ignore]"
			fi
			load_plugins=("${(R)load_plugins[@]:#$ignore}") 
			defer_1_plugins=("${(R)defer_1_plugins[@]:#$ignore}") 
			defer_2_plugins=("${(R)defer_2_plugins[@]:#$ignore}") 
			defer_3_plugins=("${(R)defer_3_plugins[@]:#$ignore}") 
			lazy_plugins=("${(R)lazy_plugins[@]:#$ignore}") 
			load_fpaths=("${(R)load_fpaths[@]:#$ignore}") 
		done
	fi
	reply=() 
	[[ -n $load_fpaths ]] && reply+=("load_fpaths" "${(F)load_fpaths}") 
	[[ -n $load_plugins ]] && reply+=("load_plugins" "${(F)load_plugins}") 
	[[ -n $lazy_plugins ]] && reply+=("lazy_plugins" "${(F)lazy_plugins}") 
	[[ -n $defer_1_plugins ]] && reply+=("defer_1_plugins" "${(F)defer_1_plugins}") 
	[[ -n $defer_2_plugins ]] && reply+=("defer_2_plugins" "${(F)defer_2_plugins}") 
	[[ -n $defer_3_plugins ]] && reply+=("defer_3_plugins" "${(F)defer_3_plugins}") 
	[[ -n $tags[hook-load] ]] && reply+=("hook_load" "$tags[name]\0$tags[hook-load]") 
	[[ -n $load_themes ]] && reply+=("load_themes" "${(F)load_themes}") 
	return 0
}
__zplug::sources::oh-my-zsh::load_theme () {
	local repo="$1" 
	local -A tags default_tags
	local -a load_themes load_fpaths
	local -a themes_ext
	tags[dir]="$(
    __zplug::core::core::run_interfaces \
        'dir' \
        "$repo"
    )" 
	themes_ext=("zsh-theme" "theme-zsh") 
	load_fpaths=() 
	load_themes=() 
	if [[ -z $ZSH ]]
	then
		export ZSH="$ZPLUG_REPOS/$_ZPLUG_OHMYZSH" 
		export ZSH_CACHE_DIR="$ZSH/cache/" 
	fi
	case "$repo" in
		(themes/*) load_themes=(${(@f)"$(__zplug::utils::omz::depends "$repo")"} ${(@f)"$( \
                    __zplug::utils::shell::expand_glob "$tags[dir]/${repo}.${^themes_ext}" "(N-.)"
                )"})  ;;
	esac
	reply=() 
	[[ -n $load_themes ]] && reply+=("load_themes" "${(F)load_themes}") 
	[[ -n $load_fpaths ]] && reply+=("load_fpaths" "${(F)load_fpaths}") 
	[[ -n $tags[hook-load] ]] && reply+=("hook_load" "$tags[name]\0$tags[hook-load]") 
	return 0
}
__zplug::sources::oh-my-zsh::update () {
	local repo="$1" 
	local -A tags
	tags[dir]="$(
    __zplug::core::core::run_interfaces \
        'dir' \
        "$repo"
    )" 
	tags[at]="$(
    __zplug::core::core::run_interfaces \
        'at' \
        "$repo"
    )" 
	__zplug::utils::git::merge --dir "$tags[dir]" --branch "$tags[at]" --repo "$repo"
	return $status
}
__zplug::sources::prezto::check () {
	local repo="$1" 
	local -A tags
	tags[dir]="$(
    __zplug::core::core::run_interfaces \
        'dir' \
        "$repo"
    )" 
	[[ -n $tags[dir] ]] && [[ -d $tags[dir] ]]
	return $status
}
__zplug::sources::prezto::get_url () {
	__zplug::sources::github::get_url "$_ZPLUG_PREZTO"
}
__zplug::sources::prezto::install () {
	local repo="$1" 
	if __zplug::sources::prezto::check "$repo"
	then
		return 0
	fi
	__zplug::utils::git::clone "$_ZPLUG_PREZTO"
	return $status
}
__zplug::sources::prezto::load_plugin () {
	local repo="${1:?}" 
	local -A tags
	local -A default_tags
	local module_name
	local dependency
	local -a unclassified_plugins load_fpaths load_plugins lazy_plugins defer_1_plugins defer_2_plugins defer_3_plugins
	__zplug::core::tags::parse "$repo"
	tags=("${reply[@]}") 
	default_tags[use]="$(__zplug::core::core::run_interfaces 'use')" 
	unclassified_plugins=() 
	load_fpaths=() 
	load_plugins=() 
	lazy_plugins=() 
	defer_1_plugins=() 
	defer_2_plugins=() 
	defer_3_plugins=() 
	if [[ ! -d $tags[dir] ]]
	then
		zstyle ":prezto:module:$module_name" loaded "no"
		return 1
	fi
	if (( ! $+functions[pmodload] ))
	then
		pmodload () {
			
		}
	fi
	module_name="${tags[name]#*/}" 
	for dependency in ${(@f)"$(__zplug::utils::prezto::depends "$module_name")"}
	do
		unclassified_plugins+=("$tags[dir]/modules/$dependency"/init.zsh(N-.)) 
	done
	if [[ $tags[name] == modules/prompt ]]
	then
		defer_2_plugins+=("$tags[dir]/$tags[name]"/init.zsh(N-.)) 
	else
		if [[ $tags[use] != $default_tags[use] ]]
		then
			unclassified_plugins+=("$tags[dir]"/${~tags[use]}(N-.)) 
		elif [[ -f $tags[dir]/$tags[name]/init.zsh ]]
		then
			unclassified_plugins+=("$tags[dir]/$tags[name]"/init.zsh(N-.)) 
		fi
	fi
	if [[ -d $tags[dir]/$tags[name]/functions ]]
	then
		load_fpaths+=("$tags[dir]/$tags[name]"/functions(N-/)) 
		() {
			setopt local_options extended_glob
			local pfunction_glob='^([_.]*|prompt_*_setup|README*)(-.N:t)' 
			lazy_plugins=("$tags[dir]/$tags[name]/functions"/${~pfunction_glob}) 
		}
	fi
	zstyle ":prezto:module:$module_name" loaded "yes"
	if [[ $TERM == dumb ]]
	then
		zstyle ":prezto:*:*" color "no"
		zstyle ":prezto:module:prompt" theme "off"
	fi
	case "$tags[defer]" in
		(0) if (( $_zplug_boolean_true[(I)$tags[lazy]] ))
			then
				lazy_plugins+=("${unclassified_plugins[@]}") 
			else
				load_plugins+=("${unclassified_plugins[@]}") 
			fi ;;
		(1) defer_1_plugins+=("${unclassified_plugins[@]}")  ;;
		(2) defer_2_plugins+=("${unclassified_plugins[@]}")  ;;
		(3) defer_3_plugins+=("${unclassified_plugins[@]}")  ;;
		(*) : ;;
	esac
	unclassified_plugins=() 
	if [[ -n $tags[ignore] ]]
	then
		ignore_patterns=($(
        zsh -c "$_ZPLUG_CONFIG_SUBSHELL; echo ${tags[dir]}/${~tags[ignore]}" \
            2> >(__zplug::log::capture::error)
        )(N)) 
		for ignore in "${ignore_patterns[@]}"
		do
			if [[ -n $load_commands[(i)$ignore] ]]
			then
				unset "load_commands[$ignore]"
			fi
			load_plugins=("${(R)load_plugins[@]:#$ignore}") 
			defer_1_plugins=("${(R)defer_1_plugins[@]:#$ignore}") 
			defer_2_plugins=("${(R)defer_2_plugins[@]:#$ignore}") 
			defer_3_plugins=("${(R)defer_3_plugins[@]:#$ignore}") 
			lazy_plugins=("${(R)lazy_plugins[@]:#$ignore}") 
			load_fpaths=("${(R)load_fpaths[@]:#$ignore}") 
		done
	fi
	reply=() 
	[[ -n $load_fpaths ]] && reply+=("load_fpaths" "${(F)load_fpaths}") 
	[[ -n $load_plugins ]] && reply+=("load_plugins" "${(F)load_plugins}") 
	[[ -n $lazy_plugins ]] && reply+=("lazy_plugins" "${(F)lazy_plugins}") 
	[[ -n $defer_1_plugins ]] && reply+=("defer_1_plugins" "${(F)defer_1_plugins}") 
	[[ -n $defer_2_plugins ]] && reply+=("defer_2_plugins" "${(F)defer_2_plugins}") 
	[[ -n $defer_3_plugins ]] && reply+=("defer_3_plugins" "${(F)defer_3_plugins}") 
	[[ -n $tags[hook-load] ]] && reply+=("hook_load" "$tags[name]\0$tags[hook-load]") 
	return 0
}
__zplug::sources::prezto::update () {
	local repo="$1" 
	local -A tags
	tags[dir]="$(
    __zplug::core::core::run_interfaces \
        'dir' \
        "$repo"
    )" 
	tags[at]="$(
    __zplug::core::core::run_interfaces \
        'at' \
        "$repo"
    )" 
	__zplug::utils::git::merge --dir "$tags[dir]" --branch "$tags[at]" --repo "$repo"
	return $status
}
__zplug::utils::ansi::cursor_up () {
	printf "\033[%sA" "${1:-"1"}"
}
__zplug::utils::ansi::erace_current_line () {
	printf "\033[2K\r"
}
__zplug::utils::ansi::remove () {
	perl -pe 's/\e\[?.*?[\@-~]//g'
}
__zplug::utils::awk::available () {
	local awk_path
	__zplug::utils::awk::path | read awk_path
	if [[ -n $awk_path ]]
	then
		return 0
	else
		return 1
	fi
}
__zplug::utils::awk::ltsv () {
	local user_awk_script="$1" ltsv_awk_script 
	ltsv_awk_script=$(command cat <<-'EOS'
    function key(name) {
        for (i = 1; i <= NF; i++) {
            match($i, ":");
            xs[substr($i, 0, RSTART)] = substr($i, RSTART+1);
        };
        return xs[name":"];
    }
EOS
    ) 
	awk -F'\t' "${ltsv_awk_script} ${user_awk_script}"
}
__zplug::utils::awk::path () {
	local awk_path
	local -a awk_paths
	local awk variant
	for awk_path in ${^path[@]}/{g,n,m,}awk
	do
		if [[ -x $awk_path ]]
		then
			awk_paths+=("$awk_path") 
		fi
	done
	if (( $#awk_paths == 0 ))
	then
		__zplug::log::write::error "gawk or nawk is not found"
		return 1
	fi
	for awk_path in "${awk_paths[@]}"
	do
		if ${=awk_path} --version 2>&1 | grep -q "GNU Awk"
		then
			variant="gawk" 
			awk="$awk_path" 
			break
		elif ${=awk_path} -Wv 2>&1 | grep -q "mawk"
		then
			variant=${variant:-"mawk"} 
			echo $awk:$variant
		else
			variant="nawk" 
			awk="$awk_path" 
			continue
		fi
	done
	if [[ $awk == "" || $variant == "mawk" ]]
	then
		__zplug::log::write::error "gawk or nawk is not found"
		return 1
	fi
	echo "$awk"
}
__zplug::utils::git::checkout () {
	local repo="$1" 
	local -a do_not_checkout
	local -A tags
	local lock_name
	tags[at]="$(__zplug::core::core::run_interfaces 'at' "$repo")" 
	tags[dir]="$(__zplug::core::core::run_interfaces 'dir' "$repo")" 
	tags[from]="$(__zplug::core::core::run_interfaces 'from' "$repo")" 
	do_not_checkout=("gh-r") 
	if [[ ! -d $tags[dir]/.git ]]
	then
		do_not_checkout+=("local") 
	fi
	if (( $do_not_checkout[(I)$tags[from]] ))
	then
		return 0
	fi
	(
		if ! __zplug::utils::shell::cd "$tags[dir]"
		then
			__zplug::io::print::f --die --zplug --error "no such directory '$tags[dir]' ($repo)\n"
			return 1
		fi
		if ! __zplug::utils::git::have_cloned
		then
			return 0
		fi
		lock_name="${(j:/:)${(s:/:)tags[dir]}[-2, -1]}" 
		if (( $_zplug_checkout_locks[(I)${lock_name}] ))
		then
			return 0
		fi
		_zplug_checkout_locks+=($lock_name) 
		git checkout -q "$tags[at]" 2> >(__zplug::log::capture::error) > /dev/null
		_zplug_checkout_locks=(${_zplug_checkout_lock:#${lock_name}}) 
		if (( $status != 0 ))
		then
			__zplug::io::print::f --die --zplug --error "pathspec '$tags[at]' (at tag) did not match ($repo)\n"
		fi
	)
}
__zplug::utils::git::clone () {
	local repo="$1" 
	local depth_option url_format
	local -i ret=1 
	local -A tags default_tags
	if [[ ! $ZPLUG_PROTOCOL =~ ^(HTTPS|https|SSH|ssh)$ ]]
	then
		__zplug::io::print::f --die --zplug --error "ZPLUG_PROTOCOL is an invalid protocol.\n"
		return 1
	fi
	__zplug::core::tags::parse "$repo"
	tags=("${reply[@]}") 
	if [[ -d $tags[dir] ]]
	then
		return $_zplug_status[already]
	fi
	if [[ $tags[depth] == 0 ]]
	then
		depth_option="" 
	else
		depth_option="--depth=$tags[depth]" 
	fi
	default_tags[at]="$(
    __zplug::core::core::run_interfaces \
        'at'
    )" 
	if [[ $tags[at] != $default_tags[at] ]]
	then
		depth_option="" 
	fi
	if __zplug::core::sources::is_handler_defined "get_url" "$tags[from]"
	then
		__zplug::core::sources::use_handler "get_url" "$tags[from]" "$repo" | read url_format
		if [[ -z $url_format ]]
		then
			__zplug::io::print::f --die --zplug --error "$repo is an invalid 'user/repo' format.\n"
			return 1
		fi
		GIT_TERMINAL_PROMPT=0 git clone --quiet --recursive ${=depth_option} "$url_format" "$tags[dir]" 2> >(__zplug::log::capture::error) > /dev/null
		ret=$status 
	fi
	__zplug::utils::git::checkout "$repo" &> /dev/null
	if (( $ret == 0 ))
	then
		return $_zplug_status[success]
	else
		return $_zplug_status[failure]
	fi
}
__zplug::utils::git::get_head_branch_name () {
	local head_branch
	if __zplug::base::base::git_version 1.7.10
	then
		head_branch="$(git symbolic-ref -q --short HEAD)" 
	else
		head_branch="${$(git symbolic-ref -q HEAD)#refs/heads/}" 
	fi
	if [[ -z $head_branch ]]
	then
		git rev-parse --short HEAD
		return 1
	fi
	printf "$head_branch\n"
}
__zplug::utils::git::get_remote_name () {
	local branch="$1" remote_name 
	remote_name="$(git config branch.${branch}.remote)" 
	if [[ -z $remote_name ]]
	then
		__zplug::log::write::error "no remote repository"
		return 1
	fi
	echo "$remote_name"
}
__zplug::utils::git::get_remote_state () {
	local remote_name branch
	local merge_branch remote_show
	local state url
	local -a behind_ahead
	local -i behind ahead
	branch="$1" 
	remote_name="$(__zplug::utils::git::get_remote_name "$branch")" 
	if (( $status == 0 ))
	then
		merge_branch="${$(git config branch.${branch}.merge)#refs/heads/}" 
		remote_show="$(git remote show "$remote_name")" 
		state="$(grep "^ *$branch *pushes" <<<"$remote_show" | sed 's/.*(\(.*\)).*/\1/')" 
		if [[ -z $state ]]
		then
			behind_ahead=(${(@f)"$(git rev-list \
                --left-right \
                --count \
                "$remote_name/$merge_branch"...$branch)"}) 
			behind=$behind_ahead[1] 
			ahead=$behind_ahead[2] 
			if (( $behind > 0 ))
			then
				state="local out of date" 
			else
				origin_head="${$(git ls-remote origin HEAD)[1]}" 
				git rev-parse -q "$origin_head" 2> >(__zplug::log::capture::error) > /dev/null
				if (( $status != 0 ))
				then
					state="local out of date" 
				elif (( $ahead > 0 ))
				then
					state="fast-forwardable" 
				else
					state="up to date" 
				fi
			fi
		fi
		url="$(grep '^ *Push' <<<"$remote_show" | sed 's/^.*URL: \(.*\)$/\1/')" 
	else
		state="$remote_name" 
	fi
	echo "$state"
	echo "$url"
}
__zplug::utils::git::get_state () {
	local branch
	local -a res
	local state url
	if [[ ! -e .git ]]
	then
		return $_zplug_status[not_git_repo]
	fi
	state="not on any branch" 
	branch="$(__zplug::utils::git::get_head_branch_name)" 
	if (( $status == 0 ))
	then
		res=(${(@f)"$(__zplug::utils::git::get_remote_state "$branch")"}) 
		state="$res[1]" 
		url="$res[2]" 
	fi
	case "$state" in
		("up to date") return $_zplug_status[up_to_date] ;;
		("local out of date") return $_zplug_status[out_of_date] ;;
		("not on any branch") return $_zplug_status[not_on_branch] ;;
		(*) return $_zplug_status[unknown] ;;
	esac
}
__zplug::utils::git::have_cloned () {
	git rev-parse --is-inside-work-tree &> /dev/null && [[ "$(git rev-parse HEAD 2>/dev/null)" != "HEAD" ]]
}
__zplug::utils::git::merge () {
	local key value
	local opt arg
	local failed=false 
	local -A git
	__zplug::utils::shell::getopts "$argv[@]" | while read key value
	do
		case "$key" in
			(dir) git[dir]="$value"  ;;
			(branch) git[branch]="$value"  ;;
			(repo) git[repo]="$value"  ;;
		esac
	done
	__zplug::utils::shell::cd "$git[dir]" || return $_zplug_status[repo_not_found]
	{
		if [[ -e $git[dir]/.git/shallow ]]
		then
			git fetch --unshallow
		else
			git fetch
		fi
		git checkout -q "$git[branch]"
	} 2> >(__zplug::log::capture::error) > /dev/null
	__zplug::utils::git::get_state
	case "$status" in
		($_zplug_status[not_on_branch]) return $_zplug_status[revision_lock] ;;
	esac
	git[local]="$(git rev-parse HEAD)" 
	git[upstream]="$(git rev-parse "@{upstream}" 2> >(__zplug::log::capture::error))" 
	git[base]="$(git merge-base HEAD "@{upstream}" 2> >(__zplug::log::capture::error))" 
	if [[ -z $git[upstream] || -z $git[base] ]]
	then
		return $_zplug_status[detached_head]
	fi
	if [[ $git[local] == $git[upstream] ]]
	then
		return $_zplug_status[up_to_date]
	elif [[ $git[local] == $git[base] ]]
	then
		{
			git reset --hard HEAD
			git merge --ff-only "origin/$git[branch]"
			if (( $status != 0 ))
			then
				failed=true 
			fi
			git submodule update --init --recursive
			if (( $status != 0 ))
			then
				failed=true 
			fi
		} 2> >(__zplug::log::capture::error) > /dev/null
	elif [[ $git[upstream] == $git[base] ]]
	then
		failed=true 
	else
		__zplug::utils::shell::cd "$HOME"
		rm -rf "$git[dir]"
		__zplug::core::core::run_interfaces "install" "$git[repo]" &> /dev/null
	fi
	if $failed
	then
		return $_zplug_status[failure]
	fi
	return $_zplug_status[success]
}
__zplug::utils::git::remote_url () {
	[[ -e .git ]] || return 1
	git remote -v | sed -n '1p' | awk '{print $2}'
}
__zplug::utils::git::status () {
	local repo="$1" 
	local key val line
	local -A tags revisions
	git ls-remote --heads --tags https://github.com/"$repo".git | awk '{print $2,$1}' | sed -E 's@^refs/(heads|tags)/@@g' | while read line
	do
		key=${${(s: :)line}[1]} 
		val=${${(s: :)line}[2]} 
		revisions[$key]="$val" 
	done
	tags[dir]="$(
    __zplug::core::core::run_interfaces \
        'dir' \
        "$repo"
    )" 
	git --git-dir="$tags[dir]/.git" --work-tree="$tags[dir]" log --oneline --pretty="format:%H" --max-count=1 | read val
	revisions[local]="$val" 
	reply=("${(kv)revisions[@]}") 
}
__zplug::utils::omz::depends () {
	local lib_f func_name dep
	local -a target
	local -a -U depends
	local -a func_names
	local -A omz_libs
	local omz_repo="$ZPLUG_REPOS/$_ZPLUG_OHMYZSH" 
	for lib_f in "$omz_repo"/lib/*.zsh(.)
	do
		func_names=(${(@f)"$( \
            grep "^function" "$lib_f" \
            | sed 's/^function  *//g' \
            | sed 's/() {$//g' \
            | sed 's/ {$//g' \
            | grep -v " " \
            )"}) 
		for func_name in "${func_names[@]}"
		do
			omz_libs[$func_name]="$lib_f" 
		done
	done
	target=("$omz_repo/$1"{.zsh-theme,/*.plugin.zsh}(N-.)) 
	for lib_f in "${(k)omz_libs[@]}"
	do
		for t in "${target[@]}"
		do
			[[ -f $t ]] || continue
			sed '/^ *#/d' "$t" | egrep "(^|\s|['\"(\`])$lib_f($|\s|[\\\\'\")\`])" 2> >(__zplug::log::capture::error) > /dev/null && depends+=("$omz_libs[$lib_f]") 
		done
	done
	print -l "${depends[@]}"
}
__zplug::utils::prezto::depends () {
	local module="$1" 
	local -a -U dependencies
	local prezto_repo="$ZPLUG_REPOS/$_ZPLUG_PREZTO" 
	dependencies=() 
	for module_f in "$prezto_repo"/modules/$module/*.zsh(N)
	do
		dependencies+=(${(@s: :)"$( \
            grep "\bpmodload\b" "$module_f" 2>/dev/null \
                | sed 's/pmodload *'// \
                | sed "s/['\"]//g"
                )"}) 
	done
	for dep in "${dependencies[@]}"
	do
		echo "$dep"
	done
}
__zplug::utils::releases::get () {
	local url="$1" 
	local repo dir header artifact cmd
	local -A tags
	repo="${url:s-https://github.com/--:F[4]h}" 
	tags[dir]="$(
    __zplug::core::core::run_interfaces \
        'dir' \
        "$repo"
    )" 
	header="${url:h:t}" 
	artifact="${url:t}" 
	if (( $+commands[curl] ))
	then
		cmd="command curl -s -L -O" 
	elif (( $+commands[wget] ))
	then
		cmd="command wget" 
	fi
	(
		__zplug::utils::shell::cd --force "$tags[dir]"
		eval "$cmd $url" &> /dev/null
		__zplug::utils::releases::index "$repo" "$artifact" &> /dev/null && echo "$header" >| "$tags[dir]/INDEX"
	)
	return $status
}
__zplug::utils::releases::get_latest () {
	local repo="$1" 
	local cmd url
	url="https://github.com/$repo/releases/latest" 
	if (( $+commands[curl] ))
	then
		cmd="command curl -fsSL" 
	elif (( $+commands[wget] ))
	then
		cmd="command wget -qO -" 
	fi
	eval "$cmd $url" 2> /dev/null | grep -o '/'"$repo"'/releases/download/[^"]*' | awk -F/ '{print $6}' | sort | uniq
}
__zplug::utils::releases::get_state () {
	local state name="$1" dir="$2" 
	if [[ "$(__zplug::utils::releases::get_latest "$name")" == "$(command cat "$dir/INDEX" 2>/dev/null)" ]]
	then
		state="up to date" 
	else
		state="local out of date" 
	fi
	case "$state" in
		("up to date") return $_zplug_status[up_to_date] ;;
		("local out of date") return $_zplug_status[out_of_date] ;;
		(*) return $_zplug_status[unknown] ;;
	esac
}
__zplug::utils::releases::get_url () {
	local repo="$1" result 
	local -A tags
	local cmd url
	local arch
	local -a candidates
	{
		tags[use]="$(
        __zplug::core::core::run_interfaces \
            'use' \
            "$repo"
        )" 
		tags[at]="$(
        __zplug::core::core::run_interfaces \
            'at' \
            "$repo"
        )" 
	}
	if __zplug::utils::releases::is_64
	then
		arch="64" 
	elif __zplug::utils::releases::is_arm
	then
		arch="arm" 
	else
		arch="386" 
	fi
	url="https://github.com/$repo/releases/$tags[at]" 
	if (( $+commands[curl] ))
	then
		cmd="command curl -fsSL" 
	elif (( $+commands[wget] ))
	then
		cmd="command wget -qO -" 
	fi
	candidates=(${(@f)"$(
    eval "$cmd $url" \
        2>/dev/null \
        | grep -o '/'"$repo"'/releases/download/[^"]*'
    )"}) 
	if (( $#candidates == 0 ))
	then
		__zplug::io::print::f --die --zplug "$repo: there are no available releases\n"
		return 1
	fi
	candidates=($( echo "${(F)candidates[@]}" | grep -E "${tags[use]:-}" )) 
	if (( $#candidates > 1 ))
	then
		candidates=($( echo "${(F)candidates[@]}" | grep "$arch" )) 
	fi
	result="${candidates[1]}" 
	if [[ -z $result ]]
	then
		__zplug::io::print::f --die --zplug "$repo: repository not found\n"
		return 1
	fi
	echo "https://github.com$result"
}
__zplug::utils::releases::index () {
	local repo="$1" artifact="$2" 
	local cmd="${repo:t}" 
	local -a binaries
	case "$artifact" in
		(*.zip) unzip "$artifact"
			rm -f "$artifact" ;;
		(*.tar.bz2) tar jxvf "$artifact"
			rm -f "$artifact" ;;
		(*.tar.gz | *.tgz) tar xvf "$artifact"
			rm -f "$artifact" ;;
		(*.*) return 1 ;;
		(*)  ;;
	esac
	binaries=() 
	binaries+=(**/$cmd(N-.)) 
	binaries+=(**/*$cmd*(N-.)) 
	binaries+=(**/*(N-*)) 
	binaries+=($(file **/*(N-.)  | awk -F: '$2 ~ /executable/{print $1}')) 
	if (( $#binaries == 0 ))
	then
		return 1
	fi
	if (( $#binaries > 1 ))
	then
		__zplug::io::print::die "$cmd: Found ${(qqqj:,:)binaries[@]} in $repo\n"
	fi
	mv -f "$binaries[1]" "$cmd"
	chmod 755 "$cmd"
	rm -rf *~"$cmd"(N)
	if [[ ! -x $cmd ]]
	then
		__zplug::io::print::die "$repo: Failed to install\n"
		return 1
	fi
	__zplug::io::print::put "$repo: Installed successfully\n"
	return 0
}
__zplug::utils::releases::is_64 () {
	uname -m | grep -q "64$"
}
__zplug::utils::releases::is_arm () {
	uname -m | grep -q "^arm"
}
__zplug::utils::shell::cd () {
	local dir arg
	local -a dirs
	local is_force=false 
	while (( $# > 0 ))
	do
		arg="$1" 
		case "$arg" in
			(--force) is_force=true  ;;
			(-* | --*) return 1 ;;
			("")  ;;
			(*) dirs+=("$arg")  ;;
		esac
		shift
	done
	for dir in "$dirs[@]"
	do
		if $is_force
		then
			[[ -d $dir ]] || mkdir -p "$dir"
		fi
		builtin cd "$dir" &> /dev/null
		return $status
	done
	return 1
}
__zplug::utils::shell::eval () {
	local cmd
	eval "${=cmd}" 2> >(__zplug::log::capture::error) > /dev/null
	return $status
}
__zplug::utils::shell::expand_glob () {
	local pattern="$1" file 
	local default_modifiers="${2:-(N)}" 
	local -a matches
	if [[ ! $pattern =~ '[^/]\([^)]*\)$' ]]
	then
		pattern+="$default_modifiers" 
	fi
	matches=(${~pattern}) 
	if (( $#matches <= 1 ))
	then
		matches=($( \
            zsh -c "$_ZPLUG_CONFIG_SUBSHELL; echo $pattern" \
            2> >(__zplug::log::capture::error) \
        )) 
	fi
	for file in "${matches[@]}"
	do
		[[ -e ${~file} ]] && echo ${~file}
	done
}
__zplug::utils::shell::getopts () {
	printf "%s\n" "$argv[@]" | awk -f "$ZPLUG_ROOT/misc/contrib/getopts.awk"
}
__zplug::utils::shell::glob2regexp () {
	local -i i=0 
	local glob="$1" char 
	printf "^"
	for ((; i < $#glob; i++)) do
		char="${glob:$i:1}" 
		case "$char" in
			(\*) printf '.*' ;;
			(.) printf '\.' ;;
			("{") printf '(' ;;
			("}") printf ')' ;;
			(,) printf '|' ;;
			("?") printf '.' ;;
			(\\) printf '\\\\' ;;
			(*) printf "$char" ;;
		esac
	done
	printf "$\n"
}
__zplug::utils::shell::is_atty () {
	if [[ -t 0 && -t 1 ]]
	then
		return 0
	else
		return 1
	fi
}
__zplug::utils::shell::json_escape () {
	if (( $+commands[python] )) && python -c 'import json' 2> /dev/null
	then
		python -c '
from __future__ import print_function
import json,sys
print(json.dumps(sys.stdin.read()))' 2> >(__zplug::log::capture::error)
	else
		echo "(Not available: python with json required)"
	fi
}
__zplug::utils::shell::pipestatus () {
	local _status="${pipestatus[*]-}" 
	[[ ${_status//0 /} == 0 ]]
	return $status
}
__zplug::utils::shell::remove_deadlinks () {
	local link
	for link in "$@"
	do
		if [[ -L $link ]] && [[ ! -e $link ]]
		then
			rm -f "$link"
		fi
	done
}
__zplug::utils::shell::search_commands () {
	local -a args
	local arg element cmd_name
	local is_verbose=true 
	while (( $# > 0 ))
	do
		arg="$1" 
		case "$arg" in
			(--verbose) is_verbose=true  ;;
			(--silent) is_verbose=false  ;;
			(-* | --*) return 1 ;;
			(*) args+=("$arg")  ;;
		esac
		shift
	done
	for arg in "${args[@]}"
	do
		for element in "${(s.:.)arg}"
		do
			cmd_name="${element%% *}" 
			if (( $+commands[$cmd_name] ))
			then
				if $is_verbose
				then
					echo "$cmd_name"
				fi
				return 0
			else
				continue
			fi
		done
	done
	return 1
}
__zplug::utils::shell::sudo () {
	local pw="$ZPLUG_SUDO_PASSWORD" 
	if [[ -z $pw ]]
	then
		__zplug::log::write::error "ZPLUG_SUDO_PASSWORD: is an invalid value\n"
		return 1
	fi
	sudo -k
	echo "$pw" | sudo -S -p '' "$argv[@]"
}
__zplug::utils::shell::unansi () {
	perl -pe 's/\e\[?.*?[\@-~]//g'
}
__zplug::utils::shell::zglob () {
	(
		emulate -RL zsh
		setopt localoptions extendedglob
		local f g match mbegin mend p_dir1 p_dir2
		local MATCH MBEGIN MEND
		local pat repl fpat
		local -a files targets
		local -A from to
		p_dir1=${~1:h} 
		p_dir2=${~2:h} 
		builtin cd $p_dir1
		pat=${1:t} 
		repl=${2:t} 
		shift 2
		if [[ $pat = (#b)(*)\((\*\*##/)\)(*) ]]
		then
			fpat="$match[1]$match[2]$match[3]" 
			setopt localoptions bareglobqual
			fpat="${fpat}(odon)" 
		else
			fpat=$pat 
		fi
		files=(${~fpat}(N)) 
		for f in $files[@]
		do
			if [[ $pat = (#b)(*)\(\*\*##/\)(*) ]]
			then
				pat="$match[1](*/|)$match[2]" 
			fi
			[[ -e $f && $f = (#b)${~pat} ]] || continue
			set -- "$match[@]"
			g=${(Xe)repl}  2> /dev/null
			from[$g]=$f 
			to[$f]=$g 
		done
		for f in $files[@]
		do
			[[ -z $to[$f] ]] && continue
			targets=($p_dir1/$f $p_dir2/$to[$f]) 
			print -r -- ${(q-)targets}
		done
	)
}
__zplug::utils::yaml::parser () {
	local yaml="$1" key 
	local -A parsed_yaml
	_zplug_yaml=() 
	parsed_yaml=("${(@f)$(
    if [[ -f "$yaml" ]]; then
        command cat "$yaml"
    else
        command cat <&0
    fi \
        | __zplug::utils::yaml::tokenizer
    )}") 
	for key in "${(k)parsed_yaml[@]}"
	do
		_zplug_yaml[$key]="$parsed_yaml[$key]" 
	done
}
__zplug::utils::yaml::tokenizer () {
	local prefix="$1" 
	local s='[[:space:]]*' 
	local w='[a-zA-Z0-9_]*' 
	local fs="$(echo '@' | tr '@' '\034')" 
	sed -ne "s|^\($s\):|\1|" -e "s|^\($s\)\($w\)$s:[[:space:]]*[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p" | awk -F "$fs" '
    {
        indent = length($1) / 2;
        vname[indent] = $2;
        for (i in vname) {
            if (i > indent) {
                fidelete vname[i]
            }
        }
        if (length($3) > 0) {
            vn = "";
            for (i = 0; i < indent; i++) {
                vn=(vn)(vname[i])("_");
            }
            #printf("%s%s%s=\"%s\"\n", "'$prefix'", vn, $2, $3);
            printf("%s%s%s\n%s\n", "'$prefix'", vn, $2, $3);
        }
    }'
}
add-zle-hook-widget () {
	# undefined
	builtin autoload -XU
}
add-zsh-hook () {
	emulate -L zsh
	local -a hooktypes
	hooktypes=(chpwd precmd preexec periodic zshaddhistory zshexit zsh_directory_name) 
	local usage="Usage: add-zsh-hook hook function\nValid hooks are:\n  $hooktypes" 
	local opt
	local -a autoopts
	integer del list help
	while getopts "dDhLUzk" opt
	do
		case $opt in
			(d) del=1  ;;
			(D) del=2  ;;
			(h) help=1  ;;
			(L) list=1  ;;
			([Uzk]) autoopts+=(-$opt)  ;;
			(*) return 1 ;;
		esac
	done
	shift $(( OPTIND - 1 ))
	if (( list ))
	then
		typeset -mp "(${1:-${(@j:|:)hooktypes}})_functions"
		return $?
	elif (( help || $# != 2 || ${hooktypes[(I)$1]} == 0 ))
	then
		print -u$(( 2 - help )) $usage
		return $(( 1 - help ))
	fi
	local hook="${1}_functions" 
	local fn="$2" 
	if (( del ))
	then
		if (( ${(P)+hook} ))
		then
			if (( del == 2 ))
			then
				set -A $hook ${(P)hook:#${~fn}}
			else
				set -A $hook ${(P)hook:#$fn}
			fi
			if (( ! ${(P)#hook} ))
			then
				unset $hook
			fi
		fi
	else
		if (( ${(P)+hook} ))
		then
			if (( ${${(P)hook}[(I)$fn]} == 0 ))
			then
				typeset -ga $hook
				set -A $hook ${(P)hook} $fn
			fi
		else
			typeset -ga $hook
			set -A $hook $fn
		fi
		autoload $autoopts -- $fn
	fi
}
alias_value () {
	(( $+aliases[$1] )) && echo $aliases[$1]
}
ansible-role-init () {
	if ! [ -z $1 ]
	then
		echo "Ansible Role : $1 Creating...."
		ansible-galaxy init $1
		tree $1
	else
		echo "Usage : ansible-role-init <role name>"
		echo "Example : ansible-role-init role1"
	fi
}
ansible-version () {
	ansible --version
}
bashcompinit () {
	# undefined
	builtin autoload -XUz
}
codex () {
	AGENT=1 command codex --dangerously-bypass-approvals-and-sandbox "$@"
}
colored () {
	local -a environment
	local k v
	for k v in "${(@kv)less_termcap}"
	do
		environment+=("LESS_TERMCAP_${k}=${v}") 
	done
	environment+=(PAGER="${commands[less]:-$PAGER}") 
	environment+=(GROFF_NO_SGR=1) 
	if [[ "$OSTYPE" = solaris* ]]
	then
		environment+=(PATH="${__colored_man_pages_dir}:$PATH") 
	fi
	command env $environment "$@"
}
colors () {
	emulate -L zsh
	typeset -Ag color colour
	color=(00 none 01 bold 02 faint 22 normal 03 italic 23 no-italic 04 underline 24 no-underline 05 blink 25 no-blink 07 reverse 27 no-reverse 08 conceal 28 no-conceal 30 black 40 bg-black 31 red 41 bg-red 32 green 42 bg-green 33 yellow 43 bg-yellow 34 blue 44 bg-blue 35 magenta 45 bg-magenta 36 cyan 46 bg-cyan 37 white 47 bg-white 39 default 49 bg-default) 
	local k
	for k in ${(k)color}
	do
		color[${color[$k]}]=$k 
	done
	for k in ${color[(I)3?]}
	do
		color[fg-${color[$k]}]=$k 
	done
	for k in grey gray
	do
		color[$k]=${color[black]} 
		color[fg-$k]=${color[$k]} 
		color[bg-$k]=${color[bg-black]} 
	done
	colour=(${(kv)color}) 
	local lc=$'\e[' rc=m 
	typeset -Hg reset_color bold_color
	reset_color="$lc${color[none]}$rc" 
	bold_color="$lc${color[bold]}$rc" 
	typeset -AHg fg fg_bold fg_no_bold
	for k in ${(k)color[(I)fg-*]}
	do
		fg[${k#fg-}]="$lc${color[$k]}$rc" 
		fg_bold[${k#fg-}]="$lc${color[bold]};${color[$k]}$rc" 
		fg_no_bold[${k#fg-}]="$lc${color[normal]};${color[$k]}$rc" 
	done
	typeset -AHg bg bg_bold bg_no_bold
	for k in ${(k)color[(I)bg-*]}
	do
		bg[${k#bg-}]="$lc${color[$k]}$rc" 
		bg_bold[${k#bg-}]="$lc${color[bold]};${color[$k]}$rc" 
		bg_no_bold[${k#bg-}]="$lc${color[normal]};${color[$k]}$rc" 
	done
}
command_not_found_handle () {
	local runcnf=1 
	local retval=127 
	[[ $- == *"i"* ]] || runcnf=0 
	[[ ! -S /run/dbus/system_bus_socket ]] && runcnf=0 
	[[ ! -x '/usr/lib/packagekitd' ]] && runcnf=0 
	[[ -n ${COMP_CWORD-} ]] && runcnf=0 
	[[ ! -x '/usr/lib/pk-command-not-found' ]] && runcnf=0 
	if [ $runcnf -eq 1 ]
	then
		'/usr/lib/pk-command-not-found' "$@"
		retval=$? 
	elif [[ -n "${BASH_VERSION-}" ]]
	then
		printf 'bash: %s%s\n' "${1:+$1: }" "$(gettext PackageKit 'command not found')" >&2
	fi
	return $retval
}
command_not_found_handler () {
	command_not_found_handle "$@"
}
compaudit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion
}
compdef () {
	local opt autol type func delete eval new i ret=0 cmd svc 
	local -a match mbegin mend
	emulate -L zsh
	setopt extendedglob
	if (( ! $# ))
	then
		print -u2 "$0: I need arguments"
		return 1
	fi
	while getopts "anpPkKde" opt
	do
		case "$opt" in
			(a) autol=yes  ;;
			(n) new=yes  ;;
			([pPkK]) if [[ -n "$type" ]]
				then
					print -u2 "$0: type already set to $type"
					return 1
				fi
				if [[ "$opt" = p ]]
				then
					type=pattern 
				elif [[ "$opt" = P ]]
				then
					type=postpattern 
				elif [[ "$opt" = K ]]
				then
					type=widgetkey 
				else
					type=key 
				fi ;;
			(d) delete=yes  ;;
			(e) eval=yes  ;;
		esac
	done
	shift OPTIND-1
	if (( ! $# ))
	then
		print -u2 "$0: I need arguments"
		return 1
	fi
	if [[ -z "$delete" ]]
	then
		if [[ -z "$eval" ]] && [[ "$1" = *\=* ]]
		then
			while (( $# ))
			do
				if [[ "$1" = *\=* ]]
				then
					cmd="${1%%\=*}" 
					svc="${1#*\=}" 
					func="$_comps[${_services[(r)$svc]:-$svc}]" 
					[[ -n ${_services[$svc]} ]] && svc=${_services[$svc]} 
					[[ -z "$func" ]] && func="${${_patcomps[(K)$svc][1]}:-${_postpatcomps[(K)$svc][1]}}" 
					if [[ -n "$func" ]]
					then
						_comps[$cmd]="$func" 
						_services[$cmd]="$svc" 
					else
						print -u2 "$0: unknown command or service: $svc"
						ret=1 
					fi
				else
					print -u2 "$0: invalid argument: $1"
					ret=1 
				fi
				shift
			done
			return ret
		fi
		func="$1" 
		[[ -n "$autol" ]] && autoload -rUz "$func"
		shift
		case "$type" in
			(widgetkey) while [[ -n $1 ]]
				do
					if [[ $# -lt 3 ]]
					then
						print -u2 "$0: compdef -K requires <widget> <comp-widget> <key>"
						return 1
					fi
					[[ $1 = _* ]] || 1="_$1" 
					[[ $2 = .* ]] || 2=".$2" 
					[[ $2 = .menu-select ]] && zmodload -i zsh/complist
					zle -C "$1" "$2" "$func"
					if [[ -n $new ]]
					then
						bindkey "$3" | IFS=$' \t' read -A opt
						[[ $opt[-1] = undefined-key ]] && bindkey "$3" "$1"
					else
						bindkey "$3" "$1"
					fi
					shift 3
				done ;;
			(key) if [[ $# -lt 2 ]]
				then
					print -u2 "$0: missing keys"
					return 1
				fi
				if [[ $1 = .* ]]
				then
					[[ $1 = .menu-select ]] && zmodload -i zsh/complist
					zle -C "$func" "$1" "$func"
				else
					[[ $1 = menu-select ]] && zmodload -i zsh/complist
					zle -C "$func" ".$1" "$func"
				fi
				shift
				for i
				do
					if [[ -n $new ]]
					then
						bindkey "$i" | IFS=$' \t' read -A opt
						[[ $opt[-1] = undefined-key ]] || continue
					fi
					bindkey "$i" "$func"
				done ;;
			(*) while (( $# ))
				do
					if [[ "$1" = -N ]]
					then
						type=normal 
					elif [[ "$1" = -p ]]
					then
						type=pattern 
					elif [[ "$1" = -P ]]
					then
						type=postpattern 
					else
						case "$type" in
							(pattern) if [[ $1 = (#b)(*)=(*) ]]
								then
									_patcomps[$match[1]]="=$match[2]=$func" 
								else
									_patcomps[$1]="$func" 
								fi ;;
							(postpattern) if [[ $1 = (#b)(*)=(*) ]]
								then
									_postpatcomps[$match[1]]="=$match[2]=$func" 
								else
									_postpatcomps[$1]="$func" 
								fi ;;
							(*) if [[ "$1" = *\=* ]]
								then
									cmd="${1%%\=*}" 
									svc=yes 
								else
									cmd="$1" 
									svc= 
								fi
								if [[ -z "$new" || -z "${_comps[$1]}" ]]
								then
									_comps[$cmd]="$func" 
									[[ -n "$svc" ]] && _services[$cmd]="${1#*\=}" 
								fi ;;
						esac
					fi
					shift
				done ;;
		esac
	else
		case "$type" in
			(pattern) unset "_patcomps[$^@]" ;;
			(postpattern) unset "_postpatcomps[$^@]" ;;
			(key) print -u2 "$0: cannot restore key bindings"
				return 1 ;;
			(*) unset "_comps[$^@]" ;;
		esac
	fi
}
compdump () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion
}
compgen () {
	local opts prefix suffix job OPTARG OPTIND ret=1 
	local -a name res results jids
	local -A shortopts
	emulate -L sh
	setopt kshglob noshglob braceexpand nokshautoload
	shortopts=(a alias b builtin c command d directory e export f file g group j job k keyword u user v variable) 
	while getopts "o:A:G:C:F:P:S:W:X:abcdefgjkuv" name
	do
		case $name in
			([abcdefgjkuv]) OPTARG="${shortopts[$name]}"  ;&
			(A) case $OPTARG in
					(alias) results+=("${(k)aliases[@]}")  ;;
					(arrayvar) results+=("${(k@)parameters[(R)array*]}")  ;;
					(binding) results+=("${(k)widgets[@]}")  ;;
					(builtin) results+=("${(k)builtins[@]}" "${(k)dis_builtins[@]}")  ;;
					(command) results+=("${(k)commands[@]}" "${(k)aliases[@]}" "${(k)builtins[@]}" "${(k)functions[@]}" "${(k)reswords[@]}")  ;;
					(directory) setopt bareglobqual
						results+=(${IPREFIX}${PREFIX}*${SUFFIX}${ISUFFIX}(N-/)) 
						setopt nobareglobqual ;;
					(disabled) results+=("${(k)dis_builtins[@]}")  ;;
					(enabled) results+=("${(k)builtins[@]}")  ;;
					(export) results+=("${(k)parameters[(R)*export*]}")  ;;
					(file) setopt bareglobqual
						results+=(${IPREFIX}${PREFIX}*${SUFFIX}${ISUFFIX}(N)) 
						setopt nobareglobqual ;;
					(function) results+=("${(k)functions[@]}")  ;;
					(group) emulate zsh
						_groups -U -O res
						emulate sh
						setopt kshglob noshglob braceexpand
						results+=("${res[@]}")  ;;
					(hostname) emulate zsh
						_hosts -U -O res
						emulate sh
						setopt kshglob noshglob braceexpand
						results+=("${res[@]}")  ;;
					(job) results+=("${savejobtexts[@]%% *}")  ;;
					(keyword) results+=("${(k)reswords[@]}")  ;;
					(running) jids=("${(@k)savejobstates[(R)running*]}") 
						for job in "${jids[@]}"
						do
							results+=(${savejobtexts[$job]%% *}) 
						done ;;
					(stopped) jids=("${(@k)savejobstates[(R)suspended*]}") 
						for job in "${jids[@]}"
						do
							results+=(${savejobtexts[$job]%% *}) 
						done ;;
					(setopt | shopt) results+=("${(k)options[@]}")  ;;
					(signal) results+=("SIG${^signals[@]}")  ;;
					(user) results+=("${(k)userdirs[@]}")  ;;
					(variable) results+=("${(k)parameters[@]}")  ;;
					(helptopic)  ;;
				esac ;;
			(F) COMPREPLY=() 
				local -a args
				args=("${words[0]}" "${@[-1]}" "${words[CURRENT-2]}") 
				() {
					typeset -h words
					$OPTARG "${args[@]}"
				}
				results+=("${COMPREPLY[@]}")  ;;
			(G) setopt nullglob
				results+=(${~OPTARG}) 
				unsetopt nullglob ;;
			(W) results+=(${(Q)~=OPTARG})  ;;
			(C) results+=($(eval $OPTARG))  ;;
			(P) prefix="$OPTARG"  ;;
			(S) suffix="$OPTARG"  ;;
			(X) if [[ ${OPTARG[0]} = '!' ]]
				then
					results=("${(M)results[@]:#${OPTARG#?}}") 
				else
					results=("${results[@]:#$OPTARG}") 
				fi ;;
		esac
	done
	print -l -r -- "$prefix${^results[@]}$suffix"
}
compinit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion
}
compinstall () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion
}
complete () {
	emulate -L zsh
	local args void cmd print remove
	args=("$@") 
	zparseopts -D -a void o: A: G: W: C: F: P: S: X: a b c d e f g j k u v p=print r=remove
	if [[ -n $print ]]
	then
		printf 'complete %2$s %1$s\n' "${(@kv)_comps[(R)_bash*]#* }"
	elif [[ -n $remove ]]
	then
		for cmd
		do
			unset "_comps[$cmd]"
		done
	else
		compdef _bash_complete\ ${(j. .)${(q)args[1,-1-$#]}} "$@"
	fi
}
cursor-agent () {
	AGENT=1 command cursor-agent -f "$@"
}
debman () {
	colored $0 "$@"
}
default () {
	(( $+parameters[$1] )) && return 0
	typeset -g "$1"="$2" && return 3
}
dman () {
	colored $0 "$@"
}
dockerclean () {
	local containers=$(docker ps -a -q) 
	[[ -n "$containers" ]] && docker rm $containers
	local images=$(docker images -q) 
	[[ -n "$images" ]] && docker rmi $images
	local volumes=$(docker volume ls -f dangling=true -q) 
	[[ -n "$volumes" ]] && docker volume rm $volumes
}
edit-command-line () {
	# undefined
	builtin autoload -XUz
}
env_default () {
	[[ ${parameters[$1]} = *-export* ]] && return 0
	export "$1=$2" && return 3
}
extract () {
	[[ -z "$1" ]] && {
		echo "Usage: extract <archive>"
		return 1
	}
	[[ ! -f "$1" ]] && {
		echo "Error: '$1' not a file"
		return 1
	}
	case "$1" in
		(*.tar.bz2) tar xjf "$1" ;;
		(*.tar.gz) tar xzf "$1" ;;
		(*.tar.xz) tar xJf "$1" ;;
		(*.tar.zst) tar --zstd -xf "$1" ;;
		(*.bz2) bunzip2 "$1" ;;
		(*.rar) command -v unrar &> /dev/null || {
				echo "Need unrar"
				return 1
			}
			unrar e "$1" ;;
		(*.gz) gunzip "$1" ;;
		(*.tar) tar xf "$1" ;;
		(*.tbz2) tar xjf "$1" ;;
		(*.tgz) tar xzf "$1" ;;
		(*.zip) unzip "$1" ;;
		(*.Z) uncompress "$1" ;;
		(*.7z) command -v 7z &> /dev/null || {
				echo "Need p7zip"
				return 1
			}
			7z x "$1" ;;
		(*.xz) xz -d "$1" ;;
		(*.zst) zstd -d "$1" ;;
		(*) echo "Unknown format: $1"
			return 1 ;;
	esac
}
gawklibpath_append () {
	[ -z "$AWKLIBPATH" ] && AWKLIBPATH=`gawk 'BEGIN {print ENVIRON["AWKLIBPATH"]}'` 
	export AWKLIBPATH="$AWKLIBPATH:$*" 
}
gawklibpath_default () {
	unset AWKLIBPATH
	export AWKLIBPATH=`gawk 'BEGIN {print ENVIRON["AWKLIBPATH"]}'` 
}
gawklibpath_prepend () {
	[ -z "$AWKLIBPATH" ] && AWKLIBPATH=`gawk 'BEGIN {print ENVIRON["AWKLIBPATH"]}'` 
	export AWKLIBPATH="$*:$AWKLIBPATH" 
}
gawkpath_append () {
	[ -z "$AWKPATH" ] && AWKPATH=`gawk 'BEGIN {print ENVIRON["AWKPATH"]}'` 
	export AWKPATH="$AWKPATH:$*" 
}
gawkpath_default () {
	unset AWKPATH
	export AWKPATH=`gawk 'BEGIN {print ENVIRON["AWKPATH"]}'` 
}
gawkpath_prepend () {
	[ -z "$AWKPATH" ] && AWKPATH=`gawk 'BEGIN {print ENVIRON["AWKPATH"]}'` 
	export AWKPATH="$*:$AWKPATH" 
}
gbda () {
	git branch --no-color --merged | command grep -vE "^([+*]|\s*(main|master|develop|dev)\s*\$)" | command xargs git branch -d 2> /dev/null
}
gbds () {
	local default_branch=$(git_main_branch) 
	(( ! $? )) || default_branch=$(git_develop_branch) 
	git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch
	do
		local merge_base=$(git merge-base $default_branch $branch) 
		if [[ $(git cherry $default_branch $(git commit-tree $(git rev-parse $branch\^{tree}) -p $merge_base -m _)) = -* ]]
		then
			git branch -D $branch
		fi
	done
}
gccd () {
	setopt localoptions extendedglob
	local repo="${${@[(r)(ssh://*|git://*|ftp(s)#://*|http(s)#://*|*@*)(.git/#)#]}:-$_}" 
	command git clone --recurse-submodules "$@" || return
	[[ -d "$_" ]] && cd "$_" || cd "${${repo:t}%.git/#}"
}
gdm () {
	local current=$(git branch --show-current) 
	local protected=("main" "master") 
	if [[ ! " ${protected[@]} " =~ " ${current} " ]]
	then
		git show-ref --verify --quiet refs/heads/main && git checkout main || git show-ref --verify --quiet refs/heads/master && git checkout master || {
			echo "No main/master branch"
			return 1
		}
	fi
	git branch | sed 's/^[* ]*//' | grep -v '^main$' | grep -v '^master$' | while read -r b
	do
		git branch -D "$b"
	done
}
gdnolock () {
	git diff "$@" ":(exclude)package-lock.json" ":(exclude)*.lock"
}
gdv () {
	git diff -w "$@" | view -
}
gemini () {
	AGENT=1 command gemini -y "$@"
}
ggf () {
	local b
	[[ $# != 1 ]] && b="$(git_current_branch)" 
	git push --force origin "${b:-$1}"
}
ggfl () {
	local b
	[[ $# != 1 ]] && b="$(git_current_branch)" 
	git push --force-with-lease origin "${b:-$1}"
}
ggl () {
	if [[ $# != 0 ]] && [[ $# != 1 ]]
	then
		git pull origin "${*}"
	else
		local b
		[[ $# == 0 ]] && b="$(git_current_branch)" 
		git pull origin "${b:-$1}"
	fi
}
ggp () {
	if [[ $# != 0 ]] && [[ $# != 1 ]]
	then
		git push origin "${*}"
	else
		local b
		[[ $# == 0 ]] && b="$(git_current_branch)" 
		git push origin "${b:-$1}"
	fi
}
ggpnp () {
	if [[ $# == 0 ]]
	then
		ggl && ggp
	else
		ggl "${*}" && ggp "${*}"
	fi
}
ggu () {
	local b
	[[ $# != 1 ]] && b="$(git_current_branch)" 
	git pull --rebase origin "${b:-$1}"
}
git_commits_ahead () {
	if __git_prompt_git rev-parse --git-dir &> /dev/null
	then
		local commits="$(__git_prompt_git rev-list --count @{upstream}..HEAD 2>/dev/null)" 
		if [[ -n "$commits" && "$commits" != 0 ]]
		then
			echo "$ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX$commits$ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX"
		fi
	fi
}
git_commits_behind () {
	if __git_prompt_git rev-parse --git-dir &> /dev/null
	then
		local commits="$(__git_prompt_git rev-list --count HEAD..@{upstream} 2>/dev/null)" 
		if [[ -n "$commits" && "$commits" != 0 ]]
		then
			echo "$ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX$commits$ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX"
		fi
	fi
}
git_compare_version () {
	if __zplug::base::base::git_version "$@"
	then
		echo 1
		return 0
	fi
	echo -1
}
git_current_branch () {
	local ref
	ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null) 
	local ret=$? 
	if [[ $ret != 0 ]]
	then
		[[ $ret == 128 ]] && return
		ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null)  || return
	fi
	echo ${ref#refs/heads/}
}
git_current_user_email () {
	__git_prompt_git config user.email 2> /dev/null
}
git_current_user_name () {
	__git_prompt_git config user.name 2> /dev/null
}
git_develop_branch () {
	command git rev-parse --git-dir &> /dev/null || return
	local branch
	for branch in dev devel develop development
	do
		if command git show-ref -q --verify refs/heads/$branch
		then
			echo $branch
			return 0
		fi
	done
	echo develop
	return 1
}
git_main_branch () {
	command git rev-parse --git-dir &> /dev/null || return
	local remote ref
	for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,stable,master}
	do
		if command git show-ref -q --verify $ref
		then
			echo ${ref:t}
			return 0
		fi
	done
	for remote in origin upstream
	do
		ref=$(command git rev-parse --abbrev-ref $remote/HEAD 2>/dev/null) 
		if [[ $ref == $remote/* ]]
		then
			echo ${ref#"$remote/"}
			return 0
		fi
	done
	echo master
	return 1
}
git_previous_branch () {
	local ref
	ref=$(__git_prompt_git rev-parse --quiet --symbolic-full-name @{-1} 2> /dev/null) 
	local ret=$? 
	if [[ $ret != 0 ]] || [[ -z $ref ]]
	then
		return
	fi
	echo ${ref#refs/heads/}
}
git_prompt_ahead () {
	if [[ -n "$(__git_prompt_git rev-list origin/$(git_current_branch)..HEAD 2> /dev/null)" ]]
	then
		echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
	fi
}
git_prompt_behind () {
	if [[ -n "$(__git_prompt_git rev-list HEAD..origin/$(git_current_branch) 2> /dev/null)" ]]
	then
		echo "$ZSH_THEME_GIT_PROMPT_BEHIND"
	fi
}
git_prompt_info () {
	if [[ -n "${_OMZ_ASYNC_OUTPUT[_omz_git_prompt_info]}" ]]
	then
		echo -n "${_OMZ_ASYNC_OUTPUT[_omz_git_prompt_info]}"
	fi
}
git_prompt_long_sha () {
	local SHA
	SHA=$(__git_prompt_git rev-parse HEAD 2> /dev/null)  && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}
git_prompt_remote () {
	if [[ -n "$(__git_prompt_git show-ref origin/$(git_current_branch) 2> /dev/null)" ]]
	then
		echo "$ZSH_THEME_GIT_PROMPT_REMOTE_EXISTS"
	else
		echo "$ZSH_THEME_GIT_PROMPT_REMOTE_MISSING"
	fi
}
git_prompt_short_sha () {
	local SHA
	SHA=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null)  && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}
git_prompt_status () {
	if [[ -n "${_OMZ_ASYNC_OUTPUT[_omz_git_prompt_status]}" ]]
	then
		echo -n "${_OMZ_ASYNC_OUTPUT[_omz_git_prompt_status]}"
	fi
}
git_remote_status () {
	local remote ahead behind git_remote_status git_remote_status_detailed
	remote=${$(__git_prompt_git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/} 
	if [[ -n ${remote} ]]
	then
		ahead=$(__git_prompt_git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l) 
		behind=$(__git_prompt_git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l) 
		if [[ $ahead -eq 0 ]] && [[ $behind -eq 0 ]]
		then
			git_remote_status="$ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE" 
		elif [[ $ahead -gt 0 ]] && [[ $behind -eq 0 ]]
		then
			git_remote_status="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE" 
			git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))%{$reset_color%}" 
		elif [[ $behind -gt 0 ]] && [[ $ahead -eq 0 ]]
		then
			git_remote_status="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE" 
			git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))%{$reset_color%}" 
		elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]
		then
			git_remote_status="$ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE" 
			git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))%{$reset_color%}$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))%{$reset_color%}" 
		fi
		if [[ -n $ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED ]]
		then
			git_remote_status="$ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX${remote:gs/%/%%}$git_remote_status_detailed$ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX" 
		fi
		echo $git_remote_status
	fi
}
git_repo_name () {
	local repo_path
	if repo_path="$(__git_prompt_git rev-parse --show-toplevel 2>/dev/null)"  && [[ -n "$repo_path" ]]
	then
		echo ${repo_path:t}
	fi
}
gitlog () {
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}
glogf () {
	command -v fzf &> /dev/null || {
		echo "fzf required"
		return 1
	}
	git log --oneline --decorate --color=always | fzf --ansi --no-sort --reverse --preview 'git show --color=always {1}' --bind 'enter:execute(git show --color=always {1} | less -R)+abort'
}
goose_preexec () {
	{
		[[ "$1" =~ ^goose\ term ]] && return
		[[ "$1" =~ ^(@goose|@g)($|[[:space:]]) ]] && return
		(
			'/home/skogix/.local/bin/goose' term log "$1" &
		) 2> /dev/null
	}
}
grename () {
	if [[ -z "$1" || -z "$2" ]]
	then
		echo "Usage: $0 old_branch new_branch"
		return 1
	fi
	git branch -m "$1" "$2"
	if git push origin :"$1"
	then
		git push --set-upstream origin "$2"
	fi
}
gunwipall () {
	local _commit=$(git log --grep='--wip--' --invert-grep --max-count=1 --format=format:%H) 
	if [[ "$_commit" != "$(git rev-parse HEAD)" ]]
	then
		git reset $_commit || return 1
	fi
}
hist () {
	[[ -z "$1" ]] && {
		echo "Usage: hist <term>"
		return 1
	}
	fc -l 1 | grep "$1"
}
history-substring-search-down () {
	_history-substring-search-begin
	_history-substring-search-down-history || _history-substring-search-down-buffer || _history-substring-search-down-search
	_history-substring-search-end
}
history-substring-search-up () {
	_history-substring-search-begin
	_history-substring-search-up-history || _history-substring-search-up-buffer || _history-substring-search-up-search
	_history-substring-search-end
}
is-at-least () {
	emulate -L zsh
	local IFS=".-" min_cnt=0 ver_cnt=0 part min_ver version order 
	min_ver=(${=1}) 
	version=(${=2:-$ZSH_VERSION} 0) 
	while (( $min_cnt <= ${#min_ver} ))
	do
		while [[ "$part" != <-> ]]
		do
			(( ++ver_cnt > ${#version} )) && return 0
			if [[ ${version[ver_cnt]} = *[0-9][^0-9]* ]]
			then
				order=(${version[ver_cnt]} ${min_ver[ver_cnt]}) 
				if [[ ${version[ver_cnt]} = <->* ]]
				then
					[[ $order != ${${(On)order}} ]] && return 1
				else
					[[ $order != ${${(O)order}} ]] && return 1
				fi
				[[ $order[1] != $order[2] ]] && return 0
			fi
			part=${version[ver_cnt]##*[^0-9]} 
		done
		while true
		do
			(( ++min_cnt > ${#min_ver} )) && return 0
			[[ ${min_ver[min_cnt]} = <-> ]] && break
		done
		(( part > min_ver[min_cnt] )) && return 0
		(( part < min_ver[min_cnt] )) && return 1
		part='' 
	done
}
killport () {
	[[ -z "$1" ]] && {
		echo "Usage: killport <number>"
		return 1
	}
	local pids=$(lsof -ti :"$1" 2>/dev/null) 
	[[ -z "$pids" ]] && {
		echo "No process on port $1"
		return 0
	}
	echo "$pids" | xargs kill -9
	echo "Killed processes on port $1"
}
layout_uv () {
	source_up_if_exists
	dotenv_if_exists
	source_env_if_exists .envrc.local
	use venv
	uv sync
	if [[ -d "$UV_ACTIVE" ]]
	then
		echo "Existing project virtual environment \'$UV_PROJECT_ENVIRONMENT\'"
	else
		echo "No project virtual environment exists."
		if [[ ! -f "pyproject.toml" ]]
		then
			echo "Initializing a new Python project via \`uv init\`."
			uv init --no-readme
		else
			echo "Python project already initialized. Skipping \`uv init\`."
		fi
		[[ -f "hello.py" ]] && rm hello.py
		if [[ ! -z "$UV_PROJECT_ENVIRONMENT" ]]
		then
			echo "Project virtual environment path set to : $UV_PROJECT_ENVIRONMENT"
			uv venv "$UV_PROJECT_ENVIRONMENT"
		else
			uv venv --seed
			UV_PROJECT_ENVIRONMENT="$(pwd)/.venv" 
		fi
	fi
	PATH_add "$UV_PROJECT_ENVIRONMENT/bin"
	export UV_ACTIVE=1 
	export UV_PROJECT_ENVIRONMENT
	export UV_VENV_CLEAR=1 
	eval "$(skogcli config export-env --namespace skogai,uv)"
}
man () {
	colored $0 "$@"
}
mkcd () {
	[[ -z "$1" ]] && {
		echo "Usage: mkcd <directory>"
		return 1
	}
	mkdir -p "$1" && cd "$1"
}
n-aliases () {
	# undefined
	builtin autoload -X
}
n-cd () {
	# undefined
	builtin autoload -X
}
n-env () {
	# undefined
	builtin autoload -X
}
n-functions () {
	# undefined
	builtin autoload -X
}
n-help () {
	# undefined
	builtin autoload -X
}
n-history () {
	# undefined
	builtin autoload -X
}
n-kill () {
	# undefined
	builtin autoload -X
}
n-list () {
	# undefined
	builtin autoload -X
}
n-list-draw () {
	# undefined
	builtin autoload -X
}
n-list-input () {
	# undefined
	builtin autoload -X
}
n-options () {
	# undefined
	builtin autoload -X
}
n-panelize () {
	# undefined
	builtin autoload -X
}
npm_toggle_install_uninstall () {
	local line
	for line in "$BUFFER" "${history[$((HISTCMD-1))]}" "${history[$((HISTCMD-2))]}"
	do
		case "$line" in
			("npm uninstall"*) BUFFER="${line/npm uninstall/npm install}" 
				(( CURSOR = CURSOR + 2 )) ;;
			("npm install"*) BUFFER="${line/npm install/npm uninstall}" 
				(( CURSOR = CURSOR + 2 )) ;;
			("npm un "*) BUFFER="${line/npm un/npm install}" 
				(( CURSOR = CURSOR + 5 )) ;;
			("npm i "*) BUFFER="${line/npm i/npm uninstall}" 
				(( CURSOR = CURSOR + 8 )) ;;
			(*) continue ;;
		esac
		return 0
	done
	BUFFER="npm install" 
	CURSOR=${#BUFFER} 
}
nvm () {
	if [ "$#" -lt 1 ]
	then
		nvm --help
		return
	fi
	local DEFAULT_IFS
	DEFAULT_IFS=" $(nvm_echo t | command tr t \\t)
" 
	if [ "${-#*e}" != "$-" ]
	then
		set +e
		local EXIT_CODE
		IFS="${DEFAULT_IFS}" nvm "$@"
		EXIT_CODE="$?" 
		set -e
		return "$EXIT_CODE"
	elif [ "${-#*a}" != "$-" ]
	then
		set +a
		local EXIT_CODE
		IFS="${DEFAULT_IFS}" nvm "$@"
		EXIT_CODE="$?" 
		set -a
		return "$EXIT_CODE"
	elif [ -n "${BASH-}" ] && [ "${-#*E}" != "$-" ]
	then
		set +E
		local EXIT_CODE
		IFS="${DEFAULT_IFS}" nvm "$@"
		EXIT_CODE="$?" 
		set -E
		return "$EXIT_CODE"
	elif [ "${IFS}" != "${DEFAULT_IFS}" ]
	then
		IFS="${DEFAULT_IFS}" nvm "$@"
		return "$?"
	fi
	local i
	for i in "$@"
	do
		case $i in
			(--) break ;;
			('-h' | 'help' | '--help') NVM_NO_COLORS="" 
				for j in "$@"
				do
					if [ "${j}" = '--no-colors' ]
					then
						NVM_NO_COLORS="${j}" 
						break
					fi
				done
				local NVM_IOJS_PREFIX
				NVM_IOJS_PREFIX="$(nvm_iojs_prefix)" 
				local NVM_NODE_PREFIX
				NVM_NODE_PREFIX="$(nvm_node_prefix)" 
				NVM_VERSION="$(nvm --version)" 
				nvm_echo
				nvm_echo "Node Version Manager (v${NVM_VERSION})"
				nvm_echo
				nvm_echo 'Note: <version> refers to any version-like string nvm understands. This includes:'
				nvm_echo '  - full or partial version numbers, starting with an optional "v" (0.10, v0.1.2, v1)'
				nvm_echo "  - default (built-in) aliases: ${NVM_NODE_PREFIX}, stable, unstable, ${NVM_IOJS_PREFIX}, system"
				nvm_echo '  - custom aliases you define with `nvm alias foo`'
				nvm_echo
				nvm_echo ' Any options that produce colorized output should respect the `--no-colors` option.'
				nvm_echo
				nvm_echo 'Usage:'
				nvm_echo '  nvm --help                                  Show this message'
				nvm_echo '    --no-colors                               Suppress colored output'
				nvm_echo '  nvm --version                               Print out the installed version of nvm'
				nvm_echo '  nvm install [<version>]                     Download and install a <version>. Uses .nvmrc if available and version is omitted.'
				nvm_echo '   The following optional arguments, if provided, must appear directly after `nvm install`:'
				nvm_echo '    -s                                        Skip binary download, install from source only.'
				nvm_echo '    -b                                        Skip source download, install from binary only.'
				nvm_echo '    --reinstall-packages-from=<version>       When installing, reinstall packages installed in <node|iojs|node version number>'
				nvm_echo '    --lts                                     When installing, only select from LTS (long-term support) versions'
				nvm_echo '    --lts=<LTS name>                          When installing, only select from versions for a specific LTS line'
				nvm_echo '    --skip-default-packages                   When installing, skip the default-packages file if it exists'
				nvm_echo '    --latest-npm                              After installing, attempt to upgrade to the latest working npm on the given node version'
				nvm_echo '    --no-progress                             Disable the progress bar on any downloads'
				nvm_echo '    --alias=<name>                            After installing, set the alias specified to the version specified. (same as: nvm alias <name> <version>)'
				nvm_echo '    --default                                 After installing, set default alias to the version specified. (same as: nvm alias default <version>)'
				nvm_echo '    --save                                    After installing, write the specified version to .nvmrc'
				nvm_echo '  nvm uninstall <version>                     Uninstall a version'
				nvm_echo '  nvm uninstall --lts                         Uninstall using automatic LTS (long-term support) alias `lts/*`, if available.'
				nvm_echo '  nvm uninstall --lts=<LTS name>              Uninstall using automatic alias for provided LTS line, if available.'
				nvm_echo '  nvm use [<version>]                         Modify PATH to use <version>. Uses .nvmrc if available and version is omitted.'
				nvm_echo '   The following optional arguments, if provided, must appear directly after `nvm use`:'
				nvm_echo '    --silent                                  Silences stdout/stderr output'
				nvm_echo '    --lts                                     Uses automatic LTS (long-term support) alias `lts/*`, if available.'
				nvm_echo '    --lts=<LTS name>                          Uses automatic alias for provided LTS line, if available.'
				nvm_echo '    --save                                    Writes the specified version to .nvmrc.'
				nvm_echo '  nvm exec [<version>] [<command>]            Run <command> on <version>. Uses .nvmrc if available and version is omitted.'
				nvm_echo '   The following optional arguments, if provided, must appear directly after `nvm exec`:'
				nvm_echo '    --silent                                  Silences stdout/stderr output'
				nvm_echo '    --lts                                     Uses automatic LTS (long-term support) alias `lts/*`, if available.'
				nvm_echo '    --lts=<LTS name>                          Uses automatic alias for provided LTS line, if available.'
				nvm_echo '  nvm run [<version>] [<args>]                Run `node` on <version> with <args> as arguments. Uses .nvmrc if available and version is omitted.'
				nvm_echo '   The following optional arguments, if provided, must appear directly after `nvm run`:'
				nvm_echo '    --silent                                  Silences stdout/stderr output'
				nvm_echo '    --lts                                     Uses automatic LTS (long-term support) alias `lts/*`, if available.'
				nvm_echo '    --lts=<LTS name>                          Uses automatic alias for provided LTS line, if available.'
				nvm_echo '  nvm current                                 Display currently activated version of Node'
				nvm_echo '  nvm ls [<version>]                          List installed versions, matching a given <version> if provided'
				nvm_echo '    --no-colors                               Suppress colored output'
				nvm_echo '    --no-alias                                Suppress `nvm alias` output'
				nvm_echo '  nvm ls-remote [<version>]                   List remote versions available for install, matching a given <version> if provided'
				nvm_echo '    --lts                                     When listing, only show LTS (long-term support) versions'
				nvm_echo '    --lts=<LTS name>                          When listing, only show versions for a specific LTS line'
				nvm_echo '    --no-colors                               Suppress colored output'
				nvm_echo '  nvm version <version>                       Resolve the given description to a single local version'
				nvm_echo '  nvm version-remote <version>                Resolve the given description to a single remote version'
				nvm_echo '    --lts                                     When listing, only select from LTS (long-term support) versions'
				nvm_echo '    --lts=<LTS name>                          When listing, only select from versions for a specific LTS line'
				nvm_echo '  nvm deactivate                              Undo effects of `nvm` on current shell'
				nvm_echo '    --silent                                  Silences stdout/stderr output'
				nvm_echo '  nvm alias [<pattern>]                       Show all aliases beginning with <pattern>'
				nvm_echo '    --no-colors                               Suppress colored output'
				nvm_echo '  nvm alias <name> <version>                  Set an alias named <name> pointing to <version>'
				nvm_echo '  nvm unalias <name>                          Deletes the alias named <name>'
				nvm_echo '  nvm install-latest-npm                      Attempt to upgrade to the latest working `npm` on the current node version'
				nvm_echo '  nvm reinstall-packages <version>            Reinstall global `npm` packages contained in <version> to current version'
				nvm_echo '  nvm unload                                  Unload `nvm` from shell'
				nvm_echo '  nvm which [current | <version>]             Display path to installed node version. Uses .nvmrc if available and version is omitted.'
				nvm_echo '    --silent                                  Silences stdout/stderr output when a version is omitted'
				nvm_echo '  nvm cache dir                               Display path to the cache directory for nvm'
				nvm_echo '  nvm cache clear                             Empty cache directory for nvm'
				nvm_echo '  nvm set-colors [<color codes>]              Set five text colors using format "yMeBg". Available when supported.'
				nvm_echo '                                               Initial colors are:'
				nvm_echo_with_colors "                                                  $(nvm_wrap_with_color_code 'b' 'b')$(nvm_wrap_with_color_code 'y' 'y')$(nvm_wrap_with_color_code 'g' 'g')$(nvm_wrap_with_color_code 'r' 'r')$(nvm_wrap_with_color_code 'e' 'e')"
				nvm_echo '                                               Color codes:'
				nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code 'r' 'r')/$(nvm_wrap_with_color_code 'R' 'R') = $(nvm_wrap_with_color_code 'r' 'red') / $(nvm_wrap_with_color_code 'R' 'bold red')"
				nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code 'g' 'g')/$(nvm_wrap_with_color_code 'G' 'G') = $(nvm_wrap_with_color_code 'g' 'green') / $(nvm_wrap_with_color_code 'G' 'bold green')"
				nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code 'b' 'b')/$(nvm_wrap_with_color_code 'B' 'B') = $(nvm_wrap_with_color_code 'b' 'blue') / $(nvm_wrap_with_color_code 'B' 'bold blue')"
				nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code 'c' 'c')/$(nvm_wrap_with_color_code 'C' 'C') = $(nvm_wrap_with_color_code 'c' 'cyan') / $(nvm_wrap_with_color_code 'C' 'bold cyan')"
				nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code 'm' 'm')/$(nvm_wrap_with_color_code 'M' 'M') = $(nvm_wrap_with_color_code 'm' 'magenta') / $(nvm_wrap_with_color_code 'M' 'bold magenta')"
				nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code 'y' 'y')/$(nvm_wrap_with_color_code 'Y' 'Y') = $(nvm_wrap_with_color_code 'y' 'yellow') / $(nvm_wrap_with_color_code 'Y' 'bold yellow')"
				nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code 'k' 'k')/$(nvm_wrap_with_color_code 'K' 'K') = $(nvm_wrap_with_color_code 'k' 'black') / $(nvm_wrap_with_color_code 'K' 'bold black')"
				nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code 'e' 'e')/$(nvm_wrap_with_color_code 'W' 'W') = $(nvm_wrap_with_color_code 'e' 'light grey') / $(nvm_wrap_with_color_code 'W' 'white')"
				nvm_echo 'Example:'
				nvm_echo '  nvm install 8.0.0                     Install a specific version number'
				nvm_echo '  nvm use 8.0                           Use the latest available 8.0.x release'
				nvm_echo '  nvm run 6.10.3 app.js                 Run app.js using node 6.10.3'
				nvm_echo '  nvm exec 4.8.3 node app.js            Run `node app.js` with the PATH pointing to node 4.8.3'
				nvm_echo '  nvm alias default 8.1.0               Set default node version on a shell'
				nvm_echo '  nvm alias default node                Always default to the latest available node version on a shell'
				nvm_echo
				nvm_echo '  nvm install node                      Install the latest available version'
				nvm_echo '  nvm use node                          Use the latest version'
				nvm_echo '  nvm install --lts                     Install the latest LTS version'
				nvm_echo '  nvm use --lts                         Use the latest LTS version'
				nvm_echo
				nvm_echo '  nvm set-colors cgYmW                  Set text colors to cyan, green, bold yellow, magenta, and white'
				nvm_echo
				nvm_echo 'Note:'
				nvm_echo '  to remove, delete, or uninstall nvm - just remove the `$NVM_DIR` folder (usually `~/.nvm`)'
				nvm_echo
				return 0 ;;
		esac
	done
	local COMMAND
	COMMAND="${1-}" 
	shift
	local VERSION
	local ADDITIONAL_PARAMETERS
	case $COMMAND in
		("cache") case "${1-}" in
				(dir) nvm_cache_dir ;;
				(clear) local DIR
					DIR="$(nvm_cache_dir)" 
					if command rm -rf "${DIR}" && command mkdir -p "${DIR}"
					then
						nvm_echo 'nvm cache cleared.'
					else
						nvm_err "Unable to clear nvm cache: ${DIR}"
						return 1
					fi ;;
				(*) nvm --help >&2
					return 127 ;;
			esac ;;
		("debug") local OS_VERSION
			nvm_is_zsh && setopt local_options shwordsplit
			nvm_err "nvm --version: v$(nvm --version)"
			if [ -n "${TERM_PROGRAM-}" ]
			then
				nvm_err "\$TERM_PROGRAM: ${TERM_PROGRAM}"
			fi
			nvm_err "\$SHELL: ${SHELL}"
			nvm_err "\$SHLVL: ${SHLVL-}"
			nvm_err "whoami: '$(whoami)'"
			nvm_err "\${HOME}: ${HOME}"
			nvm_err "\${NVM_DIR}: '$(nvm_sanitize_path "${NVM_DIR}")'"
			nvm_err "\${PATH}: $(nvm_sanitize_path "${PATH}")"
			nvm_err "\$PREFIX: '$(nvm_sanitize_path "${PREFIX}")'"
			nvm_err "\${NPM_CONFIG_PREFIX}: '$(nvm_sanitize_path "${NPM_CONFIG_PREFIX}")'"
			nvm_err "\$NVM_NODEJS_ORG_MIRROR: '${NVM_NODEJS_ORG_MIRROR}'"
			nvm_err "\$NVM_IOJS_ORG_MIRROR: '${NVM_IOJS_ORG_MIRROR}'"
			nvm_err "shell version: '$(${SHELL} --version | command head -n 1)'"
			nvm_err "uname -a: '$(command uname -a | command awk '{$2=""; print}' | command xargs)'"
			nvm_err "checksum binary: '$(nvm_get_checksum_binary 2>/dev/null)'"
			if [ "$(nvm_get_os)" = "darwin" ] && nvm_has sw_vers
			then
				OS_VERSION="$(sw_vers | command awk '{print $2}' | command xargs)" 
			elif [ -r "/etc/issue" ]
			then
				OS_VERSION="$(command head -n 1 /etc/issue | command sed 's/\\.//g')" 
				if [ -z "${OS_VERSION}" ] && [ -r "/etc/os-release" ]
				then
					OS_VERSION="$(. /etc/os-release && echo "${NAME}" "${VERSION}")" 
				fi
			fi
			if [ -n "${OS_VERSION}" ]
			then
				nvm_err "OS version: ${OS_VERSION}"
			fi
			if nvm_has "awk"
			then
				nvm_err "awk: $(nvm_command_info awk), $({ command awk --version 2>/dev/null || command awk -W version; } \
          | command head -n 1)"
			else
				nvm_err "awk: not found"
			fi
			if nvm_has "curl"
			then
				nvm_err "curl: $(nvm_command_info curl), $(command curl -V | command head -n 1)"
			else
				nvm_err "curl: not found"
			fi
			if nvm_has "wget"
			then
				nvm_err "wget: $(nvm_command_info wget), $(command wget -V | command head -n 1)"
			else
				nvm_err "wget: not found"
			fi
			local TEST_TOOLS ADD_TEST_TOOLS
			TEST_TOOLS="git grep" 
			ADD_TEST_TOOLS="sed cut basename rm mkdir xargs" 
			if [ "darwin" != "$(nvm_get_os)" ] && [ "freebsd" != "$(nvm_get_os)" ]
			then
				TEST_TOOLS="${TEST_TOOLS} ${ADD_TEST_TOOLS}" 
			else
				for tool in ${ADD_TEST_TOOLS}
				do
					if nvm_has "${tool}"
					then
						nvm_err "${tool}: $(nvm_command_info "${tool}")"
					else
						nvm_err "${tool}: not found"
					fi
				done
			fi
			for tool in ${TEST_TOOLS}
			do
				local NVM_TOOL_VERSION
				if nvm_has "${tool}"
				then
					if command ls -l "$(nvm_command_info "${tool}" | command awk '{print $1}')" | command grep -q busybox
					then
						NVM_TOOL_VERSION="$(command "${tool}" --help 2>&1 | command head -n 1)" 
					else
						NVM_TOOL_VERSION="$(command "${tool}" --version 2>&1 | command head -n 1)" 
					fi
					nvm_err "${tool}: $(nvm_command_info "${tool}"), ${NVM_TOOL_VERSION}"
				else
					nvm_err "${tool}: not found"
				fi
				unset NVM_TOOL_VERSION
			done
			unset TEST_TOOLS ADD_TEST_TOOLS
			local NVM_DEBUG_OUTPUT
			for NVM_DEBUG_COMMAND in 'nvm current' 'which node' 'which iojs' 'which npm' 'npm config get prefix' 'npm root -g'
			do
				NVM_DEBUG_OUTPUT="$(${NVM_DEBUG_COMMAND} 2>&1)" 
				nvm_err "${NVM_DEBUG_COMMAND}: $(nvm_sanitize_path "${NVM_DEBUG_OUTPUT}")"
			done
			return 42 ;;
		("install" | "i") local version_not_provided
			version_not_provided=0 
			local NVM_OS
			NVM_OS="$(nvm_get_os)" 
			if ! nvm_has "curl" && ! nvm_has "wget"
			then
				nvm_err 'nvm needs curl or wget to proceed.'
				return 1
			fi
			if [ $# -lt 1 ]
			then
				version_not_provided=1 
			fi
			local nobinary
			local nosource
			local noprogress
			nobinary=0 
			noprogress=0 
			nosource=0 
			local LTS
			local ALIAS
			local NVM_UPGRADE_NPM
			NVM_UPGRADE_NPM=0 
			local NVM_WRITE_TO_NVMRC
			NVM_WRITE_TO_NVMRC=0 
			local PROVIDED_REINSTALL_PACKAGES_FROM
			local REINSTALL_PACKAGES_FROM
			local SKIP_DEFAULT_PACKAGES
			while [ $# -ne 0 ]
			do
				case "$1" in
					(---*) nvm_err 'arguments with `---` are not supported - this is likely a typo'
						return 55 ;;
					(-s) shift
						nobinary=1 
						if [ $nosource -eq 1 ]
						then
							nvm err '-s and -b cannot be set together since they would skip install from both binary and source'
							return 6
						fi ;;
					(-b) shift
						nosource=1 
						if [ $nobinary -eq 1 ]
						then
							nvm err '-s and -b cannot be set together since they would skip install from both binary and source'
							return 6
						fi ;;
					(-j) shift
						nvm_get_make_jobs "$1"
						shift ;;
					(--no-progress) noprogress=1 
						shift ;;
					(--lts) LTS='*' 
						shift ;;
					(--lts=*) LTS="${1##--lts=}" 
						shift ;;
					(--latest-npm) NVM_UPGRADE_NPM=1 
						shift ;;
					(--default) if [ -n "${ALIAS-}" ]
						then
							nvm_err '--default and --alias are mutually exclusive, and may not be provided more than once'
							return 6
						fi
						ALIAS='default' 
						shift ;;
					(--alias=*) if [ -n "${ALIAS-}" ]
						then
							nvm_err '--default and --alias are mutually exclusive, and may not be provided more than once'
							return 6
						fi
						ALIAS="${1##--alias=}" 
						shift ;;
					(--reinstall-packages-from=*) if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ]
						then
							nvm_err '--reinstall-packages-from may not be provided more than once'
							return 6
						fi
						PROVIDED_REINSTALL_PACKAGES_FROM="$(nvm_echo "$1" | command cut -c 27-)" 
						if [ -z "${PROVIDED_REINSTALL_PACKAGES_FROM}" ]
						then
							nvm_err 'If --reinstall-packages-from is provided, it must point to an installed version of node.'
							return 6
						fi
						REINSTALL_PACKAGES_FROM="$(nvm_version "${PROVIDED_REINSTALL_PACKAGES_FROM}")"  || :
						shift ;;
					(--copy-packages-from=*) if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ]
						then
							nvm_err '--reinstall-packages-from may not be provided more than once, or combined with `--copy-packages-from`'
							return 6
						fi
						PROVIDED_REINSTALL_PACKAGES_FROM="$(nvm_echo "$1" | command cut -c 22-)" 
						if [ -z "${PROVIDED_REINSTALL_PACKAGES_FROM}" ]
						then
							nvm_err 'If --copy-packages-from is provided, it must point to an installed version of node.'
							return 6
						fi
						REINSTALL_PACKAGES_FROM="$(nvm_version "${PROVIDED_REINSTALL_PACKAGES_FROM}")"  || :
						shift ;;
					(--reinstall-packages-from | --copy-packages-from) nvm_err "If ${1} is provided, it must point to an installed version of node using \`=\`."
						return 6 ;;
					(--skip-default-packages) SKIP_DEFAULT_PACKAGES=true 
						shift ;;
					(--save | -w) if [ $NVM_WRITE_TO_NVMRC -eq 1 ]
						then
							nvm_err '--save and -w may only be provided once'
							return 6
						fi
						NVM_WRITE_TO_NVMRC=1 
						shift ;;
					(*) break ;;
				esac
			done
			local provided_version
			provided_version="${1-}" 
			if [ -z "${provided_version}" ]
			then
				if [ "_${LTS-}" = '_*' ]
				then
					nvm_echo 'Installing latest LTS version.'
					if [ $# -gt 0 ]
					then
						shift
					fi
				elif [ "_${LTS-}" != '_' ]
				then
					nvm_echo "Installing with latest version of LTS line: ${LTS}"
					if [ $# -gt 0 ]
					then
						shift
					fi
				else
					nvm_rc_version
					if [ $version_not_provided -eq 1 ] && [ -z "${NVM_RC_VERSION}" ]
					then
						unset NVM_RC_VERSION
						nvm --help >&2
						return 127
					fi
					provided_version="${NVM_RC_VERSION}" 
					unset NVM_RC_VERSION
				fi
			elif [ $# -gt 0 ]
			then
				shift
			fi
			case "${provided_version}" in
				('lts/*') LTS='*' 
					provided_version=''  ;;
				(lts/*) LTS="${provided_version##lts/}" 
					provided_version=''  ;;
			esac
			local EXIT_CODE
			VERSION="$(NVM_VERSION_ONLY=true NVM_LTS="${LTS-}" nvm_remote_version "${provided_version}")" 
			EXIT_CODE="$?" 
			if [ "${VERSION}" = 'N/A' ] || [ $EXIT_CODE -ne 0 ]
			then
				local LTS_MSG
				local REMOTE_CMD
				if [ "${LTS-}" = '*' ]
				then
					LTS_MSG='(with LTS filter) ' 
					REMOTE_CMD='nvm ls-remote --lts' 
				elif [ -n "${LTS-}" ]
				then
					LTS_MSG="(with LTS filter '${LTS}') " 
					REMOTE_CMD="nvm ls-remote --lts=${LTS}" 
					if [ -z "${provided_version}" ]
					then
						nvm_err "Version with LTS filter '${LTS}' not found - try \`${REMOTE_CMD}\` to browse available versions."
						return 3
					fi
				else
					REMOTE_CMD='nvm ls-remote' 
				fi
				nvm_err "Version '${provided_version}' ${LTS_MSG-}not found - try \`${REMOTE_CMD}\` to browse available versions."
				return 3
			fi
			ADDITIONAL_PARAMETERS='' 
			while [ $# -ne 0 ]
			do
				case "$1" in
					(--reinstall-packages-from=*) if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ]
						then
							nvm_err '--reinstall-packages-from may not be provided more than once'
							return 6
						fi
						PROVIDED_REINSTALL_PACKAGES_FROM="$(nvm_echo "$1" | command cut -c 27-)" 
						if [ -z "${PROVIDED_REINSTALL_PACKAGES_FROM}" ]
						then
							nvm_err 'If --reinstall-packages-from is provided, it must point to an installed version of node.'
							return 6
						fi
						REINSTALL_PACKAGES_FROM="$(nvm_version "${PROVIDED_REINSTALL_PACKAGES_FROM}")"  || : ;;
					(--copy-packages-from=*) if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ]
						then
							nvm_err '--reinstall-packages-from may not be provided more than once, or combined with `--copy-packages-from`'
							return 6
						fi
						PROVIDED_REINSTALL_PACKAGES_FROM="$(nvm_echo "$1" | command cut -c 22-)" 
						if [ -z "${PROVIDED_REINSTALL_PACKAGES_FROM}" ]
						then
							nvm_err 'If --copy-packages-from is provided, it must point to an installed version of node.'
							return 6
						fi
						REINSTALL_PACKAGES_FROM="$(nvm_version "${PROVIDED_REINSTALL_PACKAGES_FROM}")"  || : ;;
					(--reinstall-packages-from | --copy-packages-from) nvm_err "If ${1} is provided, it must point to an installed version of node using \`=\`."
						return 6 ;;
					(--skip-default-packages) SKIP_DEFAULT_PACKAGES=true  ;;
					(*) ADDITIONAL_PARAMETERS="${ADDITIONAL_PARAMETERS} $1"  ;;
				esac
				shift
			done
			if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ] && [ "$(nvm_ensure_version_prefix "${PROVIDED_REINSTALL_PACKAGES_FROM}")" = "${VERSION}" ]
			then
				nvm_err "You can't reinstall global packages from the same version of node you're installing."
				return 4
			elif [ "${REINSTALL_PACKAGES_FROM-}" = 'N/A' ]
			then
				nvm_err "If --reinstall-packages-from is provided, it must point to an installed version of node."
				return 5
			fi
			local FLAVOR
			if nvm_is_iojs_version "${VERSION}"
			then
				FLAVOR="$(nvm_iojs_prefix)" 
			else
				FLAVOR="$(nvm_node_prefix)" 
			fi
			EXIT_CODE=0 
			if nvm_is_version_installed "${VERSION}"
			then
				nvm_err "${VERSION} is already installed."
				nvm use "${VERSION}"
				EXIT_CODE=$? 
				if [ $EXIT_CODE -eq 0 ]
				then
					if [ "${NVM_UPGRADE_NPM}" = 1 ]
					then
						nvm install-latest-npm
						EXIT_CODE=$? 
					fi
					if [ $EXIT_CODE -ne 0 ] && [ -z "${SKIP_DEFAULT_PACKAGES-}" ]
					then
						nvm_install_default_packages
					fi
					if [ $EXIT_CODE -ne 0 ] && [ -n "${REINSTALL_PACKAGES_FROM-}" ] && [ "_${REINSTALL_PACKAGES_FROM}" != "_N/A" ]
					then
						nvm reinstall-packages "${REINSTALL_PACKAGES_FROM}"
						EXIT_CODE=$? 
					fi
				fi
				if [ -n "${LTS-}" ]
				then
					LTS="$(echo "${LTS}" | tr '[:upper:]' '[:lower:]')" 
					nvm_ensure_default_set "lts/${LTS}"
				else
					nvm_ensure_default_set "${provided_version}"
				fi
				if [ $NVM_WRITE_TO_NVMRC -eq 1 ]
				then
					nvm_write_nvmrc "${VERSION}"
					EXIT_CODE=$? 
				fi
				if [ $EXIT_CODE -ne 0 ] && [ -n "${ALIAS-}" ]
				then
					nvm alias "${ALIAS}" "${provided_version}"
					EXIT_CODE=$? 
				fi
				return $EXIT_CODE
			fi
			if [ -n "${NVM_INSTALL_THIRD_PARTY_HOOK-}" ]
			then
				nvm_err '** $NVM_INSTALL_THIRD_PARTY_HOOK env var set; dispatching to third-party installation method **'
				local NVM_METHOD_PREFERENCE
				NVM_METHOD_PREFERENCE='binary' 
				if [ $nobinary -eq 1 ]
				then
					NVM_METHOD_PREFERENCE='source' 
				fi
				local VERSION_PATH
				VERSION_PATH="$(nvm_version_path "${VERSION}")" 
				"${NVM_INSTALL_THIRD_PARTY_HOOK}" "${VERSION}" "${FLAVOR}" std "${NVM_METHOD_PREFERENCE}" "${VERSION_PATH}" || {
					EXIT_CODE=$? 
					nvm_err '*** Third-party $NVM_INSTALL_THIRD_PARTY_HOOK env var failed to install! ***'
					return $EXIT_CODE
				}
				if ! nvm_is_version_installed "${VERSION}"
				then
					nvm_err '*** Third-party $NVM_INSTALL_THIRD_PARTY_HOOK env var claimed to succeed, but failed to install! ***'
					return 33
				fi
				EXIT_CODE=0 
			else
				if [ "_${NVM_OS}" = "_freebsd" ]
				then
					nobinary=1 
					nvm_err "Currently, there is no binary for FreeBSD"
				elif [ "_$NVM_OS" = "_openbsd" ]
				then
					nobinary=1 
					nvm_err "Currently, there is no binary for OpenBSD"
				elif [ "_${NVM_OS}" = "_sunos" ]
				then
					if ! nvm_has_solaris_binary "${VERSION}"
					then
						nobinary=1 
						nvm_err "Currently, there is no binary of version ${VERSION} for SunOS"
					fi
				fi
				if [ $nobinary -ne 1 ] && nvm_binary_available "${VERSION}"
				then
					NVM_NO_PROGRESS="${NVM_NO_PROGRESS:-${noprogress}}" nvm_install_binary "${FLAVOR}" std "${VERSION}" "${nosource}"
					EXIT_CODE=$? 
				else
					EXIT_CODE=-1 
					if [ $nosource -eq 1 ]
					then
						nvm_err "Binary download is not available for ${VERSION}"
						EXIT_CODE=3 
					fi
				fi
				if [ $EXIT_CODE -ne 0 ] && [ $nosource -ne 1 ]
				then
					if [ -z "${NVM_MAKE_JOBS-}" ]
					then
						nvm_get_make_jobs
					fi
					if [ "_${NVM_OS}" = "_win" ]
					then
						nvm_err 'Installing from source on non-WSL Windows is not supported'
						EXIT_CODE=87 
					else
						NVM_NO_PROGRESS="${NVM_NO_PROGRESS:-${noprogress}}" nvm_install_source "${FLAVOR}" std "${VERSION}" "${NVM_MAKE_JOBS}" "${ADDITIONAL_PARAMETERS}"
						EXIT_CODE=$? 
					fi
				fi
			fi
			if [ $EXIT_CODE -eq 0 ]
			then
				if nvm_use_if_needed "${VERSION}" && nvm_install_npm_if_needed "${VERSION}"
				then
					if [ -n "${LTS-}" ]
					then
						nvm_ensure_default_set "lts/${LTS}"
					else
						nvm_ensure_default_set "${provided_version}"
					fi
					if [ "${NVM_UPGRADE_NPM}" = 1 ]
					then
						nvm install-latest-npm
						EXIT_CODE=$? 
					fi
					if [ $EXIT_CODE -eq 0 ] && [ -z "${SKIP_DEFAULT_PACKAGES-}" ]
					then
						nvm_install_default_packages
					fi
					if [ $EXIT_CODE -eq 0 ] && [ -n "${REINSTALL_PACKAGES_FROM-}" ] && [ "_${REINSTALL_PACKAGES_FROM}" != "_N/A" ]
					then
						nvm reinstall-packages "${REINSTALL_PACKAGES_FROM}"
						EXIT_CODE=$? 
					fi
				else
					EXIT_CODE=$? 
				fi
			fi
			return $EXIT_CODE ;;
		("uninstall") if [ $# -ne 1 ]
			then
				nvm --help >&2
				return 127
			fi
			local PATTERN
			PATTERN="${1-}" 
			case "${PATTERN-}" in
				(--)  ;;
				(--lts | 'lts/*') VERSION="$(nvm_match_version "lts/*")"  ;;
				(lts/*) VERSION="$(nvm_match_version "lts/${PATTERN##lts/}")"  ;;
				(--lts=*) VERSION="$(nvm_match_version "lts/${PATTERN##--lts=}")"  ;;
				(*) VERSION="$(nvm_version "${PATTERN}")"  ;;
			esac
			if [ "_${VERSION}" = "_$(nvm_ls_current)" ]
			then
				if nvm_is_iojs_version "${VERSION}"
				then
					nvm_err "nvm: Cannot uninstall currently-active io.js version, ${VERSION} (inferred from ${PATTERN})."
				else
					nvm_err "nvm: Cannot uninstall currently-active node version, ${VERSION} (inferred from ${PATTERN})."
				fi
				return 1
			fi
			if ! nvm_is_version_installed "${VERSION}"
			then
				local REQUESTED_VERSION
				REQUESTED_VERSION="${PATTERN}" 
				if [ "_${VERSION}" != "_N/A" ] && [ "_${VERSION}" != "_${PATTERN}" ]
				then
					nvm_err "Version '${VERSION}' (inferred from ${PATTERN}) is not installed."
				else
					nvm_err "Version '${REQUESTED_VERSION}' is not installed."
				fi
				return
			fi
			local SLUG_BINARY
			local SLUG_SOURCE
			if nvm_is_iojs_version "${VERSION}"
			then
				SLUG_BINARY="$(nvm_get_download_slug iojs binary std "${VERSION}")" 
				SLUG_SOURCE="$(nvm_get_download_slug iojs source std "${VERSION}")" 
			else
				SLUG_BINARY="$(nvm_get_download_slug node binary std "${VERSION}")" 
				SLUG_SOURCE="$(nvm_get_download_slug node source std "${VERSION}")" 
			fi
			local NVM_SUCCESS_MSG
			if nvm_is_iojs_version "${VERSION}"
			then
				NVM_SUCCESS_MSG="Uninstalled io.js $(nvm_strip_iojs_prefix "${VERSION}")" 
			else
				NVM_SUCCESS_MSG="Uninstalled node ${VERSION}" 
			fi
			local VERSION_PATH
			VERSION_PATH="$(nvm_version_path "${VERSION}")" 
			if ! nvm_check_file_permissions "${VERSION_PATH}"
			then
				nvm_err 'Cannot uninstall, incorrect permissions on installation folder.'
				nvm_err 'This is usually caused by running `npm install -g` as root. Run the following commands as root to fix the permissions and then try again.'
				nvm_err
				nvm_err "  chown -R $(whoami) \"$(nvm_sanitize_path "${VERSION_PATH}")\""
				nvm_err "  chmod -R u+w \"$(nvm_sanitize_path "${VERSION_PATH}")\""
				return 1
			fi
			local CACHE_DIR
			CACHE_DIR="$(nvm_cache_dir)" 
			command rm -rf "${CACHE_DIR}/bin/${SLUG_BINARY}/files" "${CACHE_DIR}/src/${SLUG_SOURCE}/files" "${VERSION_PATH}" 2> /dev/null
			nvm_echo "${NVM_SUCCESS_MSG}"
			for ALIAS in $(nvm_grep -l "${VERSION}" "$(nvm_alias_path)/*" 2>/dev/null)
			do
				nvm unalias "$(command basename "${ALIAS}")"
			done ;;
		("deactivate") local NVM_SILENT
			while [ $# -ne 0 ]
			do
				case "${1}" in
					(--silent) NVM_SILENT=1  ;;
					(--)  ;;
				esac
				shift
			done
			local NEWPATH
			NEWPATH="$(nvm_strip_path "${PATH}" "/bin")" 
			if [ "_${PATH}" = "_${NEWPATH}" ]
			then
				if [ "${NVM_SILENT:-0}" -ne 1 ]
				then
					nvm_err "Could not find ${NVM_DIR}/*/bin in \${PATH}"
				fi
			else
				export PATH="${NEWPATH}" 
				\hash -r
				if [ "${NVM_SILENT:-0}" -ne 1 ]
				then
					nvm_echo "${NVM_DIR}/*/bin removed from \${PATH}"
				fi
			fi
			if [ -n "${MANPATH-}" ]
			then
				NEWPATH="$(nvm_strip_path "${MANPATH}" "/share/man")" 
				if [ "_${MANPATH}" = "_${NEWPATH}" ]
				then
					if [ "${NVM_SILENT:-0}" -ne 1 ]
					then
						nvm_err "Could not find ${NVM_DIR}/*/share/man in \${MANPATH}"
					fi
				else
					export MANPATH="${NEWPATH}" 
					if [ "${NVM_SILENT:-0}" -ne 1 ]
					then
						nvm_echo "${NVM_DIR}/*/share/man removed from \${MANPATH}"
					fi
				fi
			fi
			if [ -n "${NODE_PATH-}" ]
			then
				NEWPATH="$(nvm_strip_path "${NODE_PATH}" "/lib/node_modules")" 
				if [ "_${NODE_PATH}" != "_${NEWPATH}" ]
				then
					export NODE_PATH="${NEWPATH}" 
					if [ "${NVM_SILENT:-0}" -ne 1 ]
					then
						nvm_echo "${NVM_DIR}/*/lib/node_modules removed from \${NODE_PATH}"
					fi
				fi
			fi
			unset NVM_BIN
			unset NVM_INC ;;
		("use") local PROVIDED_VERSION
			local NVM_SILENT
			local NVM_SILENT_ARG
			local NVM_DELETE_PREFIX
			NVM_DELETE_PREFIX=0 
			local NVM_LTS
			local IS_VERSION_FROM_NVMRC
			IS_VERSION_FROM_NVMRC=0 
			local NVM_WRITE_TO_NVMRC
			NVM_WRITE_TO_NVMRC=0 
			while [ $# -ne 0 ]
			do
				case "$1" in
					(--silent) NVM_SILENT=1 
						NVM_SILENT_ARG='--silent'  ;;
					(--delete-prefix) NVM_DELETE_PREFIX=1  ;;
					(--)  ;;
					(--lts) NVM_LTS='*'  ;;
					(--lts=*) NVM_LTS="${1##--lts=}"  ;;
					(--save | -w) if [ $NVM_WRITE_TO_NVMRC -eq 1 ]
						then
							nvm_err '--save and -w may only be provided once'
							return 6
						fi
						NVM_WRITE_TO_NVMRC=1  ;;
					(--*)  ;;
					(*) if [ -n "${1-}" ]
						then
							PROVIDED_VERSION="$1" 
						fi ;;
				esac
				shift
			done
			if [ -n "${NVM_LTS-}" ]
			then
				VERSION="$(nvm_match_version "lts/${NVM_LTS:-*}")" 
			elif [ -z "${PROVIDED_VERSION-}" ]
			then
				NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version
				if [ -n "${NVM_RC_VERSION-}" ]
				then
					PROVIDED_VERSION="${NVM_RC_VERSION}" 
					IS_VERSION_FROM_NVMRC=1 
					VERSION="$(nvm_version "${PROVIDED_VERSION}")" 
				fi
				unset NVM_RC_VERSION
				if [ -z "${VERSION}" ]
				then
					nvm_err 'Please see `nvm --help` or https://github.com/nvm-sh/nvm#nvmrc for more information.'
					return 127
				fi
			else
				VERSION="$(nvm_match_version "${PROVIDED_VERSION}")" 
			fi
			if [ -z "${VERSION}" ]
			then
				nvm --help >&2
				return 127
			fi
			if [ $NVM_WRITE_TO_NVMRC -eq 1 ]
			then
				nvm_write_nvmrc "${VERSION}"
			fi
			if [ "_${VERSION}" = '_system' ]
			then
				if nvm_has_system_node && nvm deactivate "${NVM_SILENT_ARG-}" > /dev/null 2>&1
				then
					if [ "${NVM_SILENT:-0}" -ne 1 ]
					then
						nvm_echo "Now using system version of node: $(node -v 2>/dev/null)$(nvm_print_npm_version)"
					fi
					return
				elif nvm_has_system_iojs && nvm deactivate "${NVM_SILENT_ARG-}" > /dev/null 2>&1
				then
					if [ "${NVM_SILENT:-0}" -ne 1 ]
					then
						nvm_echo "Now using system version of io.js: $(iojs --version 2>/dev/null)$(nvm_print_npm_version)"
					fi
					return
				elif [ "${NVM_SILENT:-0}" -ne 1 ]
				then
					nvm_err 'System version of node not found.'
				fi
				return 127
			elif [ "_${VERSION}" = '_∞' ]
			then
				if [ "${NVM_SILENT:-0}" -ne 1 ]
				then
					nvm_err "The alias \"${PROVIDED_VERSION}\" leads to an infinite loop. Aborting."
				fi
				return 8
			fi
			if [ "${VERSION}" = 'N/A' ]
			then
				if [ "${NVM_SILENT:-0}" -ne 1 ]
				then
					nvm_ensure_version_installed "${PROVIDED_VERSION}" "${IS_VERSION_FROM_NVMRC}"
				fi
				return 3
			elif ! nvm_ensure_version_installed "${VERSION}" "${IS_VERSION_FROM_NVMRC}"
			then
				return $?
			fi
			local NVM_VERSION_DIR
			NVM_VERSION_DIR="$(nvm_version_path "${VERSION}")" 
			PATH="$(nvm_change_path "${PATH}" "/bin" "${NVM_VERSION_DIR}")" 
			if nvm_has manpath
			then
				if [ -z "${MANPATH-}" ]
				then
					local MANPATH
					MANPATH=$(manpath) 
				fi
				MANPATH="$(nvm_change_path "${MANPATH}" "/share/man" "${NVM_VERSION_DIR}")" 
				export MANPATH
			fi
			export PATH
			\hash -r
			export NVM_BIN="${NVM_VERSION_DIR}/bin" 
			export NVM_INC="${NVM_VERSION_DIR}/include/node" 
			if [ "${NVM_SYMLINK_CURRENT-}" = true ]
			then
				command rm -f "${NVM_DIR}/current" && ln -s "${NVM_VERSION_DIR}" "${NVM_DIR}/current"
			fi
			local NVM_USE_OUTPUT
			NVM_USE_OUTPUT='' 
			if [ "${NVM_SILENT:-0}" -ne 1 ]
			then
				if nvm_is_iojs_version "${VERSION}"
				then
					NVM_USE_OUTPUT="Now using io.js $(nvm_strip_iojs_prefix "${VERSION}")$(nvm_print_npm_version)" 
				else
					NVM_USE_OUTPUT="Now using node ${VERSION}$(nvm_print_npm_version)" 
				fi
			fi
			if [ "_${VERSION}" != "_system" ]
			then
				local NVM_USE_CMD
				NVM_USE_CMD="nvm use --delete-prefix" 
				if [ -n "${PROVIDED_VERSION}" ]
				then
					NVM_USE_CMD="${NVM_USE_CMD} ${VERSION}" 
				fi
				if [ "${NVM_SILENT:-0}" -eq 1 ]
				then
					NVM_USE_CMD="${NVM_USE_CMD} --silent" 
				fi
				if ! nvm_die_on_prefix "${NVM_DELETE_PREFIX}" "${NVM_USE_CMD}" "${NVM_VERSION_DIR}"
				then
					return 11
				fi
			fi
			if [ -n "${NVM_USE_OUTPUT-}" ] && [ "${NVM_SILENT:-0}" -ne 1 ]
			then
				nvm_echo "${NVM_USE_OUTPUT}"
			fi ;;
		("run") local provided_version
			local has_checked_nvmrc
			has_checked_nvmrc=0 
			local IS_VERSION_FROM_NVMRC
			IS_VERSION_FROM_NVMRC=0 
			local NVM_SILENT
			local NVM_SILENT_ARG
			local NVM_LTS
			while [ $# -gt 0 ]
			do
				case "$1" in
					(--silent) NVM_SILENT=1 
						NVM_SILENT_ARG='--silent' 
						shift ;;
					(--lts) NVM_LTS='*' 
						shift ;;
					(--lts=*) NVM_LTS="${1##--lts=}" 
						shift ;;
					(*) if [ -n "$1" ]
						then
							break
						else
							shift
						fi ;;
				esac
			done
			if [ $# -lt 1 ] && [ -z "${NVM_LTS-}" ]
			then
				NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version && has_checked_nvmrc=1 
				if [ -n "${NVM_RC_VERSION-}" ]
				then
					VERSION="$(nvm_version "${NVM_RC_VERSION-}")"  || :
				fi
				unset NVM_RC_VERSION
				if [ "${VERSION:-N/A}" = 'N/A' ]
				then
					nvm --help >&2
					return 127
				fi
			fi
			if [ -z "${NVM_LTS-}" ]
			then
				provided_version="$1" 
				if [ -n "${provided_version}" ]
				then
					VERSION="$(nvm_version "${provided_version}")"  || :
					if [ "_${VERSION:-N/A}" = '_N/A' ] && ! nvm_is_valid_version "${provided_version}"
					then
						provided_version='' 
						if [ $has_checked_nvmrc -ne 1 ]
						then
							NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version && has_checked_nvmrc=1 
						fi
						provided_version="${NVM_RC_VERSION}" 
						IS_VERSION_FROM_NVMRC=1 
						VERSION="$(nvm_version "${NVM_RC_VERSION}")"  || :
						unset NVM_RC_VERSION
					else
						shift
					fi
				fi
			fi
			local NVM_IOJS
			if nvm_is_iojs_version "${VERSION}"
			then
				NVM_IOJS=true 
			fi
			local EXIT_CODE
			nvm_is_zsh && setopt local_options shwordsplit
			local LTS_ARG
			if [ -n "${NVM_LTS-}" ]
			then
				LTS_ARG="--lts=${NVM_LTS-}" 
				VERSION='' 
			fi
			if [ "_${VERSION}" = "_N/A" ]
			then
				nvm_ensure_version_installed "${provided_version}" "${IS_VERSION_FROM_NVMRC}"
			elif [ "${NVM_IOJS}" = true ]
			then
				nvm exec "${NVM_SILENT_ARG-}" "${LTS_ARG-}" "${VERSION}" iojs "$@"
			else
				nvm exec "${NVM_SILENT_ARG-}" "${LTS_ARG-}" "${VERSION}" node "$@"
			fi
			EXIT_CODE="$?" 
			return $EXIT_CODE ;;
		("exec") local NVM_SILENT
			local NVM_LTS
			while [ $# -gt 0 ]
			do
				case "$1" in
					(--silent) NVM_SILENT=1 
						shift ;;
					(--lts) NVM_LTS='*' 
						shift ;;
					(--lts=*) NVM_LTS="${1##--lts=}" 
						shift ;;
					(--) break ;;
					(--*) nvm_err "Unsupported option \"$1\"."
						return 55 ;;
					(*) if [ -n "$1" ]
						then
							break
						else
							shift
						fi ;;
				esac
			done
			local provided_version
			provided_version="$1" 
			if [ "${NVM_LTS-}" != '' ]
			then
				provided_version="lts/${NVM_LTS:-*}" 
				VERSION="${provided_version}" 
			elif [ -n "${provided_version}" ]
			then
				VERSION="$(nvm_version "${provided_version}")"  || :
				if [ "_${VERSION}" = '_N/A' ] && ! nvm_is_valid_version "${provided_version}"
				then
					NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version && has_checked_nvmrc=1 
					provided_version="${NVM_RC_VERSION}" 
					unset NVM_RC_VERSION
					VERSION="$(nvm_version "${provided_version}")"  || :
				else
					shift
				fi
			fi
			nvm_ensure_version_installed "${provided_version}"
			EXIT_CODE=$? 
			if [ "${EXIT_CODE}" != "0" ]
			then
				return $EXIT_CODE
			fi
			if [ "${NVM_SILENT:-0}" -ne 1 ]
			then
				if [ "${NVM_LTS-}" = '*' ]
				then
					nvm_echo "Running node latest LTS -> $(nvm_version "${VERSION}")$(nvm use --silent "${VERSION}" && nvm_print_npm_version)"
				elif [ -n "${NVM_LTS-}" ]
				then
					nvm_echo "Running node LTS \"${NVM_LTS-}\" -> $(nvm_version "${VERSION}")$(nvm use --silent "${VERSION}" && nvm_print_npm_version)"
				elif nvm_is_iojs_version "${VERSION}"
				then
					nvm_echo "Running io.js $(nvm_strip_iojs_prefix "${VERSION}")$(nvm use --silent "${VERSION}" && nvm_print_npm_version)"
				else
					nvm_echo "Running node ${VERSION}$(nvm use --silent "${VERSION}" && nvm_print_npm_version)"
				fi
			fi
			NODE_VERSION="${VERSION}" "${NVM_DIR}/nvm-exec" "$@" ;;
		("ls" | "list") local PATTERN
			local NVM_NO_COLORS
			local NVM_NO_ALIAS
			while [ $# -gt 0 ]
			do
				case "${1}" in
					(--)  ;;
					(--no-colors) NVM_NO_COLORS="${1}"  ;;
					(--no-alias) NVM_NO_ALIAS="${1}"  ;;
					(--*) nvm_err "Unsupported option \"${1}\"."
						return 55 ;;
					(*) PATTERN="${PATTERN:-$1}"  ;;
				esac
				shift
			done
			if [ -n "${PATTERN-}" ] && [ -n "${NVM_NO_ALIAS-}" ]
			then
				nvm_err '`--no-alias` is not supported when a pattern is provided.'
				return 55
			fi
			local NVM_LS_OUTPUT
			local NVM_LS_EXIT_CODE
			NVM_LS_OUTPUT=$(nvm_ls "${PATTERN-}") 
			NVM_LS_EXIT_CODE=$? 
			NVM_NO_COLORS="${NVM_NO_COLORS-}" nvm_print_versions "${NVM_LS_OUTPUT}"
			if [ -z "${NVM_NO_ALIAS-}" ] && [ -z "${PATTERN-}" ]
			then
				if [ -n "${NVM_NO_COLORS-}" ]
				then
					nvm alias --no-colors
				else
					nvm alias
				fi
			fi
			return $NVM_LS_EXIT_CODE ;;
		("ls-remote" | "list-remote") local NVM_LTS
			local PATTERN
			local NVM_NO_COLORS
			while [ $# -gt 0 ]
			do
				case "${1-}" in
					(--)  ;;
					(--lts) NVM_LTS='*'  ;;
					(--lts=*) NVM_LTS="${1##--lts=}"  ;;
					(--no-colors) NVM_NO_COLORS="${1}"  ;;
					(--*) nvm_err "Unsupported option \"${1}\"."
						return 55 ;;
					(*) if [ -z "${PATTERN-}" ]
						then
							PATTERN="${1-}" 
							if [ -z "${NVM_LTS-}" ]
							then
								case "${PATTERN}" in
									('lts/*') NVM_LTS='*' 
										PATTERN=''  ;;
									(lts/*) NVM_LTS="${PATTERN##lts/}" 
										PATTERN=''  ;;
								esac
							fi
						fi ;;
				esac
				shift
			done
			local NVM_OUTPUT
			local EXIT_CODE
			NVM_OUTPUT="$(NVM_LTS="${NVM_LTS-}" nvm_remote_versions "${PATTERN}" &&:)" 
			EXIT_CODE=$? 
			if [ -n "${NVM_OUTPUT}" ]
			then
				NVM_NO_COLORS="${NVM_NO_COLORS-}" nvm_print_versions "${NVM_OUTPUT}"
				return $EXIT_CODE
			fi
			NVM_NO_COLORS="${NVM_NO_COLORS-}" nvm_print_versions "N/A"
			return 3 ;;
		("current") nvm_version current ;;
		("which") local NVM_SILENT
			local provided_version
			while [ $# -ne 0 ]
			do
				case "${1}" in
					(--silent) NVM_SILENT=1  ;;
					(--)  ;;
					(*) provided_version="${1-}"  ;;
				esac
				shift
			done
			if [ -z "${provided_version-}" ]
			then
				NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version
				if [ -n "${NVM_RC_VERSION}" ]
				then
					provided_version="${NVM_RC_VERSION}" 
					VERSION=$(nvm_version "${NVM_RC_VERSION}")  || :
				fi
				unset NVM_RC_VERSION
			elif [ "${provided_version}" != 'system' ]
			then
				VERSION="$(nvm_version "${provided_version}")"  || :
			else
				VERSION="${provided_version-}" 
			fi
			if [ -z "${VERSION}" ]
			then
				nvm --help >&2
				return 127
			fi
			if [ "_${VERSION}" = '_system' ]
			then
				if nvm_has_system_iojs > /dev/null 2>&1 || nvm_has_system_node > /dev/null 2>&1
				then
					local NVM_BIN
					NVM_BIN="$(nvm use system >/dev/null 2>&1 && command which node)" 
					if [ -n "${NVM_BIN}" ]
					then
						nvm_echo "${NVM_BIN}"
						return
					fi
					return 1
				fi
				nvm_err 'System version of node not found.'
				return 127
			elif [ "${VERSION}" = '∞' ]
			then
				nvm_err "The alias \"${2}\" leads to an infinite loop. Aborting."
				return 8
			fi
			nvm_ensure_version_installed "${provided_version}"
			EXIT_CODE=$? 
			if [ "${EXIT_CODE}" != "0" ]
			then
				return $EXIT_CODE
			fi
			local NVM_VERSION_DIR
			NVM_VERSION_DIR="$(nvm_version_path "${VERSION}")" 
			nvm_echo "${NVM_VERSION_DIR}/bin/node" ;;
		("alias") local NVM_ALIAS_DIR
			NVM_ALIAS_DIR="$(nvm_alias_path)" 
			local NVM_CURRENT
			NVM_CURRENT="$(nvm_ls_current)" 
			command mkdir -p "${NVM_ALIAS_DIR}/lts"
			local ALIAS
			local TARGET
			local NVM_NO_COLORS
			ALIAS='--' 
			TARGET='--' 
			while [ $# -gt 0 ]
			do
				case "${1-}" in
					(--)  ;;
					(--no-colors) NVM_NO_COLORS="${1}"  ;;
					(--*) nvm_err "Unsupported option \"${1}\"."
						return 55 ;;
					(*) if [ "${ALIAS}" = '--' ]
						then
							ALIAS="${1-}" 
						elif [ "${TARGET}" = '--' ]
						then
							TARGET="${1-}" 
						fi ;;
				esac
				shift
			done
			if [ -z "${TARGET}" ]
			then
				nvm unalias "${ALIAS}"
				return $?
			elif echo "${ALIAS}" | grep -q "#"
			then
				nvm_err 'Aliases with a comment delimiter (#) are not supported.'
				return 1
			elif [ "${TARGET}" != '--' ]
			then
				if [ "${ALIAS#*\/}" != "${ALIAS}" ]
				then
					nvm_err 'Aliases in subdirectories are not supported.'
					return 1
				fi
				VERSION="$(nvm_version "${TARGET}")"  || :
				if [ "${VERSION}" = 'N/A' ]
				then
					nvm_err "! WARNING: Version '${TARGET}' does not exist."
				fi
				nvm_make_alias "${ALIAS}" "${TARGET}"
				NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_CURRENT="${NVM_CURRENT-}" DEFAULT=false nvm_print_formatted_alias "${ALIAS}" "${TARGET}" "${VERSION}"
			else
				if [ "${ALIAS-}" = '--' ]
				then
					unset ALIAS
				fi
				nvm_list_aliases "${ALIAS-}"
			fi ;;
		("unalias") local NVM_ALIAS_DIR
			NVM_ALIAS_DIR="$(nvm_alias_path)" 
			command mkdir -p "${NVM_ALIAS_DIR}"
			if [ $# -ne 1 ]
			then
				nvm --help >&2
				return 127
			fi
			if [ "${1#*\/}" != "${1-}" ]
			then
				nvm_err 'Aliases in subdirectories are not supported.'
				return 1
			fi
			local NVM_IOJS_PREFIX
			local NVM_NODE_PREFIX
			NVM_IOJS_PREFIX="$(nvm_iojs_prefix)" 
			NVM_NODE_PREFIX="$(nvm_node_prefix)" 
			local NVM_ALIAS_EXISTS
			NVM_ALIAS_EXISTS=0 
			if [ -f "${NVM_ALIAS_DIR}/${1-}" ]
			then
				NVM_ALIAS_EXISTS=1 
			fi
			if [ $NVM_ALIAS_EXISTS -eq 0 ]
			then
				case "$1" in
					("stable" | "unstable" | "${NVM_IOJS_PREFIX}" | "${NVM_NODE_PREFIX}" | "system") nvm_err "${1-} is a default (built-in) alias and cannot be deleted."
						return 1 ;;
				esac
				nvm_err "Alias ${1-} doesn't exist!"
				return
			fi
			local NVM_ALIAS_ORIGINAL
			NVM_ALIAS_ORIGINAL="$(nvm_alias "${1}")" 
			command rm -f "${NVM_ALIAS_DIR}/${1}"
			nvm_echo "Deleted alias ${1} - restore it with \`nvm alias \"${1}\" \"${NVM_ALIAS_ORIGINAL}\"\`" ;;
		("install-latest-npm") if [ $# -ne 0 ]
			then
				nvm --help >&2
				return 127
			fi
			nvm_install_latest_npm ;;
		("reinstall-packages" | "copy-packages") if [ $# -ne 1 ]
			then
				nvm --help >&2
				return 127
			fi
			local PROVIDED_VERSION
			PROVIDED_VERSION="${1-}" 
			if [ "${PROVIDED_VERSION}" = "$(nvm_ls_current)" ] || [ "$(nvm_version "${PROVIDED_VERSION}" ||:)" = "$(nvm_ls_current)" ]
			then
				nvm_err 'Can not reinstall packages from the current version of node.'
				return 2
			fi
			local VERSION
			if [ "_${PROVIDED_VERSION}" = "_system" ]
			then
				if ! nvm_has_system_node && ! nvm_has_system_iojs
				then
					nvm_err 'No system version of node or io.js detected.'
					return 3
				fi
				VERSION="system" 
			else
				VERSION="$(nvm_version "${PROVIDED_VERSION}")"  || :
			fi
			local NPMLIST
			NPMLIST="$(nvm_npm_global_modules "${VERSION}")" 
			local INSTALLS
			local LINKS
			INSTALLS="${NPMLIST%% //// *}" 
			LINKS="${NPMLIST##* //// }" 
			nvm_echo "Reinstalling global packages from ${VERSION}..."
			if [ -n "${INSTALLS}" ]
			then
				nvm_echo "${INSTALLS}" | command xargs npm install -g --quiet
			else
				nvm_echo "No installed global packages found..."
			fi
			nvm_echo "Linking global packages from ${VERSION}..."
			if [ -n "${LINKS}" ]
			then
				(
					set -f
					IFS='
' 
					for LINK in ${LINKS}
					do
						set +f
						unset IFS
						if [ -n "${LINK}" ]
						then
							case "${LINK}" in
								('/'*) (
										nvm_cd "${LINK}" && npm link
									) ;;
								(*) (
										nvm_cd "$(npm root -g)/../${LINK}" && npm link
									) ;;
							esac
						fi
					done
				)
			else
				nvm_echo "No linked global packages found..."
			fi ;;
		("clear-cache") command rm -f "${NVM_DIR}/v*" "$(nvm_version_dir)" 2> /dev/null
			nvm_echo 'nvm cache cleared.' ;;
		("version") nvm_version "${1}" ;;
		("version-remote") local NVM_LTS
			local PATTERN
			while [ $# -gt 0 ]
			do
				case "${1-}" in
					(--)  ;;
					(--lts) NVM_LTS='*'  ;;
					(--lts=*) NVM_LTS="${1##--lts=}"  ;;
					(--*) nvm_err "Unsupported option \"${1}\"."
						return 55 ;;
					(*) PATTERN="${PATTERN:-${1}}"  ;;
				esac
				shift
			done
			case "${PATTERN-}" in
				('lts/*') NVM_LTS='*' 
					unset PATTERN ;;
				(lts/*) NVM_LTS="${PATTERN##lts/}" 
					unset PATTERN ;;
			esac
			NVM_VERSION_ONLY=true NVM_LTS="${NVM_LTS-}" nvm_remote_version "${PATTERN:-node}" ;;
		("--version" | "-v") nvm_echo '0.40.4' ;;
		("unload") nvm deactivate > /dev/null 2>&1
			unset -f nvm nvm_iojs_prefix nvm_node_prefix nvm_add_iojs_prefix nvm_strip_iojs_prefix nvm_is_iojs_version nvm_is_alias nvm_has_non_aliased nvm_ls_remote nvm_ls_remote_iojs nvm_ls_remote_index_tab nvm_ls nvm_remote_version nvm_remote_versions nvm_install_binary nvm_install_source nvm_clang_version nvm_get_mirror nvm_get_download_slug nvm_download_artifact nvm_install_npm_if_needed nvm_use_if_needed nvm_check_file_permissions nvm_print_versions nvm_compute_checksum nvm_get_checksum_binary nvm_get_checksum_alg nvm_get_checksum nvm_compare_checksum nvm_version nvm_rc_version nvm_match_version nvm_ensure_default_set nvm_get_arch nvm_get_os nvm_print_implicit_alias nvm_validate_implicit_alias nvm_resolve_alias nvm_ls_current nvm_alias nvm_binary_available nvm_change_path nvm_strip_path nvm_num_version_groups nvm_format_version nvm_ensure_version_prefix nvm_normalize_version nvm_is_valid_version nvm_normalize_lts nvm_ensure_version_installed nvm_cache_dir nvm_version_path nvm_alias_path nvm_version_dir nvm_find_nvmrc nvm_find_up nvm_find_project_dir nvm_tree_contains_path nvm_version_greater nvm_version_greater_than_or_equal_to nvm_print_npm_version nvm_install_latest_npm nvm_npm_global_modules nvm_has_system_node nvm_has_system_iojs nvm_download nvm_get_latest nvm_has nvm_install_default_packages nvm_get_default_packages nvm_curl_use_compression nvm_curl_version nvm_auto nvm_supports_xz nvm_echo nvm_err nvm_grep nvm_cd nvm_die_on_prefix nvm_get_make_jobs nvm_get_minor_version nvm_has_solaris_binary nvm_is_merged_node_version nvm_is_natural_num nvm_is_version_installed nvm_list_aliases nvm_make_alias nvm_print_alias_path nvm_print_default_alias nvm_print_formatted_alias nvm_resolve_local_alias nvm_sanitize_path nvm_has_colors nvm_process_parameters nvm_node_version_has_solaris_binary nvm_iojs_version_has_solaris_binary nvm_curl_libz_support nvm_command_info nvm_is_zsh nvm_stdout_is_terminal nvm_npmrc_bad_news_bears nvm_sanitize_auth_header nvm_get_colors nvm_set_colors nvm_print_color_code nvm_wrap_with_color_code nvm_format_help_message_colors nvm_echo_with_colors nvm_err_with_colors nvm_get_artifact_compression nvm_install_binary_extract nvm_extract_tarball nvm_process_nvmrc nvm_nvmrc_invalid_msg nvm_write_nvmrc > /dev/null 2>&1
			unset NVM_RC_VERSION NVM_NODEJS_ORG_MIRROR NVM_IOJS_ORG_MIRROR NVM_DIR NVM_CD_FLAGS NVM_BIN NVM_INC NVM_MAKE_JOBS NVM_COLORS INSTALLED_COLOR SYSTEM_COLOR CURRENT_COLOR NOT_INSTALLED_COLOR DEFAULT_COLOR LTS_COLOR > /dev/null 2>&1 ;;
		("set-colors") local EXIT_CODE
			nvm_set_colors "${1-}"
			EXIT_CODE=$? 
			if [ "$EXIT_CODE" -eq 17 ]
			then
				nvm --help >&2
				nvm_echo
				nvm_err_with_colors "\033[1;37mPlease pass in five \033[1;31mvalid color codes\033[1;37m. Choose from: rRgGbBcCyYmMkKeW\033[0m"
			fi ;;
		(*) nvm --help >&2
			return 127 ;;
	esac
}
nvm_add_iojs_prefix () {
	nvm_echo "$(nvm_iojs_prefix)-$(nvm_ensure_version_prefix "$(nvm_strip_iojs_prefix "${1-}")")"
}
nvm_alias () {
	local ALIAS
	ALIAS="${1-}" 
	if [ -z "${ALIAS}" ]
	then
		nvm_err 'An alias is required.'
		return 1
	fi
	if ! ALIAS="$(nvm_normalize_lts "${ALIAS}")" 
	then
		return $?
	fi
	if [ -z "${ALIAS}" ]
	then
		return 2
	fi
	local NVM_ALIAS_PATH
	NVM_ALIAS_PATH="$(nvm_alias_path)/${ALIAS}" 
	if [ ! -f "${NVM_ALIAS_PATH}" ]
	then
		nvm_err 'Alias does not exist.'
		return 2
	fi
	command sed 's/#.*//; s/[[:space:]]*$//' "${NVM_ALIAS_PATH}" | command awk 'NF'
}
nvm_alias_path () {
	nvm_echo "$(nvm_version_dir old)/alias"
}
nvm_auto () {
	local NVM_MODE
	NVM_MODE="${1-}" 
	case "${NVM_MODE}" in
		(none) return 0 ;;
		(use) local VERSION
			local NVM_CURRENT
			NVM_CURRENT="$(nvm_ls_current)" 
			if [ "_${NVM_CURRENT}" = '_none' ] || [ "_${NVM_CURRENT}" = '_system' ]
			then
				VERSION="$(nvm_resolve_local_alias default 2>/dev/null || nvm_echo)" 
				if [ -n "${VERSION}" ]
				then
					if [ "_${VERSION}" != '_N/A' ] && nvm_is_valid_version "${VERSION}"
					then
						nvm use --silent "${VERSION}" > /dev/null
					else
						return 0
					fi
				elif nvm_rc_version > /dev/null 2>&1
				then
					nvm use --silent > /dev/null
				fi
			else
				nvm use --silent "${NVM_CURRENT}" > /dev/null
			fi ;;
		(install) local VERSION
			VERSION="$(nvm_alias default 2>/dev/null || nvm_echo)" 
			if [ -n "${VERSION}" ] && [ "_${VERSION}" != '_N/A' ] && nvm_is_valid_version "${VERSION}"
			then
				nvm install "${VERSION}" > /dev/null
			elif nvm_rc_version > /dev/null 2>&1
			then
				nvm install > /dev/null
			else
				return 0
			fi ;;
		(*) nvm_err 'Invalid auto mode supplied.'
			return 1 ;;
	esac
}
nvm_binary_available () {
	nvm_version_greater_than_or_equal_to "$(nvm_strip_iojs_prefix "${1-}")" v0.8.6
}
nvm_cache_dir () {
	nvm_echo "${NVM_DIR}/.cache"
}
nvm_cd () {
	\cd "$@"
}
nvm_change_path () {
	if [ -z "${1-}" ]
	then
		nvm_echo "${3-}${2-}"
	elif ! nvm_echo "${1-}" | nvm_grep -q "${NVM_DIR}/[^/]*${2-}" && ! nvm_echo "${1-}" | nvm_grep -q "${NVM_DIR}/versions/[^/]*/[^/]*${2-}"
	then
		nvm_echo "${3-}${2-}:${1-}"
	elif nvm_echo "${1-}" | nvm_grep -Eq "(^|:)(/usr(/local)?)?${2-}:.*${NVM_DIR}/[^/]*${2-}" || nvm_echo "${1-}" | nvm_grep -Eq "(^|:)(/usr(/local)?)?${2-}:.*${NVM_DIR}/versions/[^/]*/[^/]*${2-}"
	then
		nvm_echo "${3-}${2-}:${1-}"
	else
		nvm_echo "${1-}" | command sed -e "s#${NVM_DIR}/[^/]*${2-}[^:]*#${3-}${2-}#" -e "s#${NVM_DIR}/versions/[^/]*/[^/]*${2-}[^:]*#${3-}${2-}#"
	fi
}
nvm_check_file_permissions () {
	nvm_is_zsh && setopt local_options nonomatch
	for FILE in "$1"/* "$1"/.[!.]* "$1"/..?*
	do
		if [ -d "$FILE" ]
		then
			if [ -n "${NVM_DEBUG-}" ]
			then
				nvm_err "${FILE}"
			fi
			if [ ! -L "${FILE}" ] && ! nvm_check_file_permissions "${FILE}"
			then
				return 2
			fi
		elif [ -e "$FILE" ] && [ ! -w "$FILE" ] && [ -z "$(command find "${FILE}" -prune -user "$(command id -u)")" ]
		then
			nvm_err "file is not writable or self-owned: $(nvm_sanitize_path "$FILE")"
			return 1
		fi
	done
	return 0
}
nvm_clang_version () {
	clang --version | command awk '{ if ($2 == "version") print $3; else if ($3 == "version") print $4 }' | command sed 's/-.*$//g'
}
nvm_command_info () {
	local COMMAND
	local INFO
	COMMAND="${1}" 
	if type "${COMMAND}" | nvm_grep -q hashed
	then
		INFO="$(type "${COMMAND}" | command sed -E 's/\(|\)//g' | command awk '{print $4}')" 
	elif type "${COMMAND}" | nvm_grep -q aliased
	then
		INFO="$(which "${COMMAND}") ($(type "${COMMAND}" | command awk '{ $1=$2=$3=$4="" ;print }' | command sed -e 's/^\ *//g' -Ee "s/\`|'//g"))" 
	elif type "${COMMAND}" | nvm_grep -q "^${COMMAND} is an alias for"
	then
		INFO="$(which "${COMMAND}") ($(type "${COMMAND}" | command awk '{ $1=$2=$3=$4=$5="" ;print }' | command sed 's/^\ *//g'))" 
	elif type "${COMMAND}" | nvm_grep -q "^${COMMAND} is /"
	then
		INFO="$(type "${COMMAND}" | command awk '{print $3}')" 
	else
		INFO="$(type "${COMMAND}")" 
	fi
	nvm_echo "${INFO}"
}
nvm_compare_checksum () {
	local FILE
	FILE="${1-}" 
	if [ -z "${FILE}" ]
	then
		nvm_err 'Provided file to checksum is empty.'
		return 4
	elif ! [ -f "${FILE}" ]
	then
		nvm_err 'Provided file to checksum does not exist.'
		return 3
	fi
	local COMPUTED_SUM
	COMPUTED_SUM="$(nvm_compute_checksum "${FILE}")" 
	local CHECKSUM
	CHECKSUM="${2-}" 
	if [ -z "${CHECKSUM}" ]
	then
		nvm_err 'Provided checksum to compare to is empty.'
		return 2
	fi
	if [ -z "${COMPUTED_SUM}" ]
	then
		nvm_err "Computed checksum of '${FILE}' is empty."
		nvm_err 'WARNING: Continuing *without checksum verification*'
		return
	elif [ "${COMPUTED_SUM}" != "${CHECKSUM}" ] && [ "${COMPUTED_SUM}" != "\\${CHECKSUM}" ]
	then
		nvm_err "Checksums do not match: '${COMPUTED_SUM}' found, '${CHECKSUM}' expected."
		return 1
	fi
	nvm_err 'Checksums matched!'
}
nvm_compute_checksum () {
	local FILE
	FILE="${1-}" 
	if [ -z "${FILE}" ]
	then
		nvm_err 'Provided file to checksum is empty.'
		return 2
	elif ! [ -f "${FILE}" ]
	then
		nvm_err 'Provided file to checksum does not exist.'
		return 1
	fi
	if nvm_has_non_aliased "sha256sum"
	then
		nvm_err 'Computing checksum with sha256sum'
		command sha256sum "${FILE}" | command awk '{print $1}'
	elif nvm_has_non_aliased "shasum"
	then
		nvm_err 'Computing checksum with shasum -a 256'
		command shasum -a 256 "${FILE}" | command awk '{print $1}'
	elif nvm_has_non_aliased "sha256"
	then
		nvm_err 'Computing checksum with sha256 -q'
		command sha256 -q "${FILE}" | command awk '{print $1}'
	elif nvm_has_non_aliased "gsha256sum"
	then
		nvm_err 'Computing checksum with gsha256sum'
		command gsha256sum "${FILE}" | command awk '{print $1}'
	elif nvm_has_non_aliased "openssl"
	then
		nvm_err 'Computing checksum with openssl dgst -sha256'
		command openssl dgst -sha256 "${FILE}" | command awk '{print $NF}'
	elif nvm_has_non_aliased "bssl"
	then
		nvm_err 'Computing checksum with bssl sha256sum'
		command bssl sha256sum "${FILE}" | command awk '{print $1}'
	elif nvm_has_non_aliased "sha1sum"
	then
		nvm_err 'Computing checksum with sha1sum'
		command sha1sum "${FILE}" | command awk '{print $1}'
	elif nvm_has_non_aliased "sha1"
	then
		nvm_err 'Computing checksum with sha1 -q'
		command sha1 -q "${FILE}"
	fi
}
nvm_curl_libz_support () {
	curl -V 2> /dev/null | nvm_grep "^Features:" | nvm_grep -q "libz"
}
nvm_curl_use_compression () {
	nvm_curl_libz_support && nvm_version_greater_than_or_equal_to "$(nvm_curl_version)" 7.21.0
}
nvm_curl_version () {
	curl -V | command awk '{ if ($1 == "curl") print $2 }' | command sed 's/-.*$//g'
}
nvm_die_on_prefix () {
	local NVM_DELETE_PREFIX
	NVM_DELETE_PREFIX="${1-}" 
	case "${NVM_DELETE_PREFIX}" in
		(0 | 1)  ;;
		(*) nvm_err 'First argument "delete the prefix" must be zero or one'
			return 1 ;;
	esac
	local NVM_COMMAND
	NVM_COMMAND="${2-}" 
	local NVM_VERSION_DIR
	NVM_VERSION_DIR="${3-}" 
	if [ -z "${NVM_COMMAND}" ] || [ -z "${NVM_VERSION_DIR}" ]
	then
		nvm_err 'Second argument "nvm command", and third argument "nvm version dir", must both be nonempty'
		return 2
	fi
	if [ -n "${PREFIX-}" ] && [ "$(nvm_version_path "$(node -v)")" != "${PREFIX}" ]
	then
		nvm deactivate > /dev/null 2>&1
		nvm_err "nvm is not compatible with the \"PREFIX\" environment variable: currently set to \"${PREFIX}\""
		nvm_err 'Run `unset PREFIX` to unset it.'
		return 3
	fi
	local NVM_OS
	NVM_OS="$(nvm_get_os)" 
	local NVM_NPM_CONFIG_x_PREFIX_ENV
	NVM_NPM_CONFIG_x_PREFIX_ENV="$(command awk 'BEGIN { for (name in ENVIRON) if (toupper(name) == "NPM_CONFIG_PREFIX") { print name; break } }')" 
	if [ -n "${NVM_NPM_CONFIG_x_PREFIX_ENV-}" ]
	then
		local NVM_CONFIG_VALUE
		eval "NVM_CONFIG_VALUE=\"\$${NVM_NPM_CONFIG_x_PREFIX_ENV}\""
		if [ -n "${NVM_CONFIG_VALUE-}" ] && [ "_${NVM_OS}" = "_win" ]
		then
			NVM_CONFIG_VALUE="$(cd "$NVM_CONFIG_VALUE" 2>/dev/null && pwd)" 
		fi
		if [ -n "${NVM_CONFIG_VALUE-}" ] && ! nvm_tree_contains_path "${NVM_DIR}" "${NVM_CONFIG_VALUE}"
		then
			nvm deactivate > /dev/null 2>&1
			nvm_err "nvm is not compatible with the \"${NVM_NPM_CONFIG_x_PREFIX_ENV}\" environment variable: currently set to \"${NVM_CONFIG_VALUE}\""
			nvm_err "Run \`unset ${NVM_NPM_CONFIG_x_PREFIX_ENV}\` to unset it."
			return 4
		fi
	fi
	local NVM_NPM_BUILTIN_NPMRC
	NVM_NPM_BUILTIN_NPMRC="${NVM_VERSION_DIR}/lib/node_modules/npm/npmrc" 
	if nvm_npmrc_bad_news_bears "${NVM_NPM_BUILTIN_NPMRC}"
	then
		if [ "_${NVM_DELETE_PREFIX}" = "_1" ]
		then
			npm config --loglevel=warn delete prefix --userconfig="${NVM_NPM_BUILTIN_NPMRC}"
			npm config --loglevel=warn delete globalconfig --userconfig="${NVM_NPM_BUILTIN_NPMRC}"
		else
			nvm_err "Your builtin npmrc file ($(nvm_sanitize_path "${NVM_NPM_BUILTIN_NPMRC}"))"
			nvm_err 'has a `globalconfig` and/or a `prefix` setting, which are incompatible with nvm.'
			nvm_err "Run \`${NVM_COMMAND}\` to unset it."
			return 10
		fi
	fi
	local NVM_NPM_GLOBAL_NPMRC
	NVM_NPM_GLOBAL_NPMRC="${NVM_VERSION_DIR}/etc/npmrc" 
	if nvm_npmrc_bad_news_bears "${NVM_NPM_GLOBAL_NPMRC}"
	then
		if [ "_${NVM_DELETE_PREFIX}" = "_1" ]
		then
			npm config --global --loglevel=warn delete prefix
			npm config --global --loglevel=warn delete globalconfig
		else
			nvm_err "Your global npmrc file ($(nvm_sanitize_path "${NVM_NPM_GLOBAL_NPMRC}"))"
			nvm_err 'has a `globalconfig` and/or a `prefix` setting, which are incompatible with nvm.'
			nvm_err "Run \`${NVM_COMMAND}\` to unset it."
			return 10
		fi
	fi
	local NVM_NPM_USER_NPMRC
	NVM_NPM_USER_NPMRC="${HOME}/.npmrc" 
	if nvm_npmrc_bad_news_bears "${NVM_NPM_USER_NPMRC}"
	then
		if [ "_${NVM_DELETE_PREFIX}" = "_1" ]
		then
			npm config --loglevel=warn delete prefix --userconfig="${NVM_NPM_USER_NPMRC}"
			npm config --loglevel=warn delete globalconfig --userconfig="${NVM_NPM_USER_NPMRC}"
		else
			nvm_err "Your user’s .npmrc file ($(nvm_sanitize_path "${NVM_NPM_USER_NPMRC}"))"
			nvm_err 'has a `globalconfig` and/or a `prefix` setting, which are incompatible with nvm.'
			nvm_err "Run \`${NVM_COMMAND}\` to unset it."
			return 10
		fi
	fi
	local NVM_NPM_PROJECT_NPMRC
	NVM_NPM_PROJECT_NPMRC="$(nvm_find_project_dir)/.npmrc" 
	if nvm_npmrc_bad_news_bears "${NVM_NPM_PROJECT_NPMRC}"
	then
		if [ "_${NVM_DELETE_PREFIX}" = "_1" ]
		then
			npm config --loglevel=warn delete prefix
			npm config --loglevel=warn delete globalconfig
		else
			nvm_err "Your project npmrc file ($(nvm_sanitize_path "${NVM_NPM_PROJECT_NPMRC}"))"
			nvm_err 'has a `globalconfig` and/or a `prefix` setting, which are incompatible with nvm.'
			nvm_err "Run \`${NVM_COMMAND}\` to unset it."
			return 10
		fi
	fi
}
nvm_download () {
	if nvm_has "curl"
	then
		local CURL_COMPRESSED_FLAG="" 
		local CURL_HEADER_FLAG="" 
		if [ -n "${NVM_AUTH_HEADER:-}" ]
		then
			sanitized_header=$(nvm_sanitize_auth_header "${NVM_AUTH_HEADER}") 
			CURL_HEADER_FLAG="--header \"Authorization: ${sanitized_header}\"" 
		fi
		if nvm_curl_use_compression
		then
			CURL_COMPRESSED_FLAG="--compressed" 
		fi
		local NVM_DOWNLOAD_ARGS
		NVM_DOWNLOAD_ARGS='' 
		for arg in "$@"
		do
			NVM_DOWNLOAD_ARGS="${NVM_DOWNLOAD_ARGS} \"$arg\"" 
		done
		eval "curl -q --fail ${CURL_COMPRESSED_FLAG:-} ${CURL_HEADER_FLAG:-} ${NVM_DOWNLOAD_ARGS}"
	elif nvm_has "wget"
	then
		ARGS=$(nvm_echo "$@" | command sed "
      s/--progress-bar /--progress=bar /
      s/--compressed //
      s/--fail //
      s/-L //
      s/-I /--server-response /
      s/-s /-q /
      s/-sS /-nv /
      s/-o /-O /
      s/-C - /-c /
    ") 
		if [ -n "${NVM_AUTH_HEADER:-}" ]
		then
			sanitized_header=$(nvm_sanitize_auth_header "${NVM_AUTH_HEADER}") 
			ARGS="${ARGS} --header \"${sanitized_header}\"" 
		fi
		eval wget $ARGS
	fi
}
nvm_download_artifact () {
	local FLAVOR
	case "${1-}" in
		(node | iojs) FLAVOR="${1}"  ;;
		(*) nvm_err 'supported flavors: node, iojs'
			return 1 ;;
	esac
	local KIND
	case "${2-}" in
		(binary | source) KIND="${2}"  ;;
		(*) nvm_err 'supported kinds: binary, source'
			return 1 ;;
	esac
	local TYPE
	TYPE="${3-}" 
	local MIRROR
	MIRROR="$(nvm_get_mirror "${FLAVOR}" "${TYPE}")" 
	if [ -z "${MIRROR}" ]
	then
		return 2
	fi
	local VERSION
	VERSION="${4}" 
	if [ -z "${VERSION}" ]
	then
		nvm_err 'A version number is required.'
		return 3
	fi
	if [ "${KIND}" = 'binary' ] && ! nvm_binary_available "${VERSION}"
	then
		nvm_err "No precompiled binary available for ${VERSION}."
		return
	fi
	local SLUG
	SLUG="$(nvm_get_download_slug "${FLAVOR}" "${KIND}" "${VERSION}")" 
	local COMPRESSION
	COMPRESSION="$(nvm_get_artifact_compression "${VERSION}")" 
	local CHECKSUM
	CHECKSUM="$(nvm_get_checksum "${FLAVOR}" "${TYPE}" "${VERSION}" "${SLUG}" "${COMPRESSION}")" 
	local tmpdir
	if [ "${KIND}" = 'binary' ]
	then
		tmpdir="$(nvm_cache_dir)/bin/${SLUG}" 
	else
		tmpdir="$(nvm_cache_dir)/src/${SLUG}" 
	fi
	command mkdir -p "${tmpdir}/files" || (
		nvm_err "creating directory ${tmpdir}/files failed"
		return 3
	)
	local TARBALL
	TARBALL="${tmpdir}/${SLUG}.${COMPRESSION}" 
	local TARBALL_URL
	if nvm_version_greater_than_or_equal_to "${VERSION}" 0.1.14
	then
		TARBALL_URL="${MIRROR}/${VERSION}/${SLUG}.${COMPRESSION}" 
	else
		TARBALL_URL="${MIRROR}/${SLUG}.${COMPRESSION}" 
	fi
	if [ -r "${TARBALL}" ]
	then
		nvm_err "Local cache found: $(nvm_sanitize_path "${TARBALL}")"
		if nvm_compare_checksum "${TARBALL}" "${CHECKSUM}" > /dev/null 2>&1
		then
			nvm_err "Checksums match! Using existing downloaded archive $(nvm_sanitize_path "${TARBALL}")"
			nvm_echo "${TARBALL}"
			return 0
		fi
		nvm_compare_checksum "${TARBALL}" "${CHECKSUM}"
		nvm_err "Checksum check failed!"
		nvm_err "Removing the broken local cache..."
		command rm -rf "${TARBALL}"
	fi
	nvm_err "Downloading ${TARBALL_URL}..."
	nvm_download -L -C - "${PROGRESS_BAR}" "${TARBALL_URL}" -o "${TARBALL}" || (
		command rm -rf "${TARBALL}" "${tmpdir}"
		nvm_err "download from ${TARBALL_URL} failed"
		return 4
	)
	if nvm_grep '404 Not Found' "${TARBALL}" > /dev/null
	then
		command rm -rf "${TARBALL}" "${tmpdir}"
		nvm_err "HTTP 404 at URL ${TARBALL_URL}"
		return 5
	fi
	nvm_compare_checksum "${TARBALL}" "${CHECKSUM}" || (
		command rm -rf "${tmpdir}/files"
		return 6
	)
	nvm_echo "${TARBALL}"
}
nvm_echo () {
	command printf %s\\n "$*" 2> /dev/null
}
nvm_echo_with_colors () {
	command printf %b\\n "$*" 2> /dev/null
}
nvm_ensure_default_set () {
	local VERSION
	VERSION="$1" 
	if [ -z "${VERSION}" ]
	then
		nvm_err 'nvm_ensure_default_set: a version is required'
		return 1
	elif nvm_alias default > /dev/null 2>&1
	then
		return 0
	fi
	local OUTPUT
	OUTPUT="$(nvm alias default "${VERSION}")" 
	local EXIT_CODE
	EXIT_CODE="$?" 
	nvm_echo "Creating default alias: ${OUTPUT}"
	return $EXIT_CODE
}
nvm_ensure_version_installed () {
	local PROVIDED_VERSION
	PROVIDED_VERSION="${1-}" 
	local IS_VERSION_FROM_NVMRC
	IS_VERSION_FROM_NVMRC="${2-}" 
	if [ "${PROVIDED_VERSION}" = 'system' ]
	then
		if nvm_has_system_iojs || nvm_has_system_node
		then
			return 0
		fi
		nvm_err "N/A: no system version of node/io.js is installed."
		return 1
	fi
	local LOCAL_VERSION
	local EXIT_CODE
	LOCAL_VERSION="$(nvm_version "${PROVIDED_VERSION}")" 
	EXIT_CODE="$?" 
	local NVM_VERSION_DIR
	if [ "${EXIT_CODE}" != "0" ] || ! nvm_is_version_installed "${LOCAL_VERSION}"
	then
		if VERSION="$(nvm_resolve_alias "${PROVIDED_VERSION}")" 
		then
			nvm_err "N/A: version \"${PROVIDED_VERSION} -> ${VERSION}\" is not yet installed."
		else
			local PREFIXED_VERSION
			PREFIXED_VERSION="$(nvm_ensure_version_prefix "${PROVIDED_VERSION}")" 
			nvm_err "N/A: version \"${PREFIXED_VERSION:-$PROVIDED_VERSION}\" is not yet installed."
		fi
		nvm_err ""
		if [ "${PROVIDED_VERSION}" = 'lts' ]
		then
			nvm_err '`lts` is not an alias - you may need to run `nvm install --lts` to install and `nvm use --lts` to use it.'
		elif [ "${IS_VERSION_FROM_NVMRC}" != '1' ]
		then
			nvm_err "You need to run \`nvm install ${PROVIDED_VERSION}\` to install and use it."
		else
			nvm_err 'You need to run `nvm install` to install and use the node version specified in `.nvmrc`.'
		fi
		return 1
	fi
}
nvm_ensure_version_prefix () {
	local NVM_VERSION
	NVM_VERSION="$(nvm_strip_iojs_prefix "${1-}" | command sed -e 's/^\([0-9]\)/v\1/g')" 
	if nvm_is_iojs_version "${1-}"
	then
		nvm_add_iojs_prefix "${NVM_VERSION}"
	else
		nvm_echo "${NVM_VERSION}"
	fi
}
nvm_err () {
	nvm_echo "$@" >&2
}
nvm_err_with_colors () {
	nvm_echo_with_colors "$@" >&2
}
nvm_extract_tarball () {
	if [ "$#" -ne 4 ]
	then
		nvm_err 'nvm_extract_tarball requires exactly 4 arguments'
		return 5
	fi
	local NVM_OS
	NVM_OS="${1-}" 
	local VERSION
	VERSION="${2-}" 
	local TARBALL
	TARBALL="${3-}" 
	local TMPDIR
	TMPDIR="${4-}" 
	local tar_compression_flag
	tar_compression_flag='z' 
	if nvm_supports_xz "${VERSION}"
	then
		tar_compression_flag='J' 
	fi
	local tar
	tar='tar' 
	if [ "${NVM_OS}" = 'aix' ]
	then
		tar='gtar' 
	fi
	if [ "${NVM_OS}" = 'openbsd' ]
	then
		if [ "${tar_compression_flag}" = 'J' ]
		then
			command xzcat "${TARBALL}" | "${tar}" -xf - -C "${TMPDIR}" -s '/[^\/]*\///' || return 1
		else
			command "${tar}" -x${tar_compression_flag}f "${TARBALL}" -C "${TMPDIR}" -s '/[^\/]*\///' || return 1
		fi
	else
		command "${tar}" -x${tar_compression_flag}f "${TARBALL}" -C "${TMPDIR}" --strip-components 1 || return 1
	fi
}
nvm_find_nvmrc () {
	local dir
	dir="$(nvm_find_up '.nvmrc')" 
	if [ -e "${dir}/.nvmrc" ]
	then
		nvm_echo "${dir}/.nvmrc"
	fi
}
nvm_find_project_dir () {
	local path_
	path_="${PWD}" 
	while [ "${path_}" != "" ] && [ "${path_}" != '.' ] && [ ! -f "${path_}/package.json" ] && [ ! -d "${path_}/node_modules" ]
	do
		path_=${path_%/*} 
	done
	nvm_echo "${path_}"
}
nvm_find_up () {
	local path_
	path_="${PWD}" 
	while [ "${path_}" != "" ] && [ "${path_}" != '.' ] && [ ! -f "${path_}/${1-}" ]
	do
		path_=${path_%/*} 
	done
	nvm_echo "${path_}"
}
nvm_format_version () {
	local VERSION
	VERSION="$(nvm_ensure_version_prefix "${1-}")" 
	local NUM_GROUPS
	NUM_GROUPS="$(nvm_num_version_groups "${VERSION}")" 
	if [ "${NUM_GROUPS}" -lt 3 ]
	then
		nvm_format_version "${VERSION%.}.0"
	else
		nvm_echo "${VERSION}" | command cut -f1-3 -d.
	fi
}
nvm_get_arch () {
	local HOST_ARCH
	local NVM_OS
	local EXIT_CODE
	local LONG_BIT
	NVM_OS="$(nvm_get_os)" 
	if [ "_${NVM_OS}" = "_sunos" ]
	then
		if HOST_ARCH=$(pkg_info -Q MACHINE_ARCH pkg_install) 
		then
			HOST_ARCH=$(nvm_echo "${HOST_ARCH}" | command tail -1) 
		else
			HOST_ARCH=$(isainfo -n) 
		fi
	elif [ "_${NVM_OS}" = "_aix" ]
	then
		HOST_ARCH=ppc64 
	else
		HOST_ARCH="$(command uname -m)" 
		LONG_BIT="$(getconf LONG_BIT 2>/dev/null)" 
	fi
	local NVM_ARCH
	case "${HOST_ARCH}" in
		(x86_64 | amd64) NVM_ARCH="x64"  ;;
		(i*86) NVM_ARCH="x86"  ;;
		(aarch64 | armv8l) NVM_ARCH="arm64"  ;;
		(*) NVM_ARCH="${HOST_ARCH}"  ;;
	esac
	if [ "_${LONG_BIT}" = "_32" ] && [ "${NVM_ARCH}" = "x64" ]
	then
		NVM_ARCH="x86" 
	fi
	if [ "$(uname)" = "Linux" ] && [ "${NVM_ARCH}" = arm64 ] && [ "$(command od -An -t x1 -j 4 -N 1 "/sbin/init" 2>/dev/null)" = ' 01' ]
	then
		NVM_ARCH=armv7l 
		HOST_ARCH=armv7l 
	fi
	if [ -f "/etc/alpine-release" ]
	then
		NVM_ARCH=x64-musl 
	fi
	nvm_echo "${NVM_ARCH}"
}
nvm_get_artifact_compression () {
	local VERSION
	VERSION="${1-}" 
	local NVM_OS
	NVM_OS="$(nvm_get_os)" 
	local COMPRESSION
	COMPRESSION='tar.gz' 
	if [ "_${NVM_OS}" = '_win' ]
	then
		COMPRESSION='zip' 
	elif nvm_supports_xz "${VERSION}"
	then
		COMPRESSION='tar.xz' 
	fi
	nvm_echo "${COMPRESSION}"
}
nvm_get_checksum () {
	local FLAVOR
	case "${1-}" in
		(node | iojs) FLAVOR="${1}"  ;;
		(*) nvm_err 'supported flavors: node, iojs'
			return 2 ;;
	esac
	local MIRROR
	MIRROR="$(nvm_get_mirror "${FLAVOR}" "${2-}")" 
	if [ -z "${MIRROR}" ]
	then
		return 1
	fi
	local SHASUMS_URL
	if [ "$(nvm_get_checksum_alg)" = 'sha-256' ]
	then
		SHASUMS_URL="${MIRROR}/${3}/SHASUMS256.txt" 
	else
		SHASUMS_URL="${MIRROR}/${3}/SHASUMS.txt" 
	fi
	nvm_download -L -s "${SHASUMS_URL}" -o - | command awk "{ if (\"${4}.${5}\" == \$2) print \$1}"
}
nvm_get_checksum_alg () {
	local NVM_CHECKSUM_BIN
	NVM_CHECKSUM_BIN="$(nvm_get_checksum_binary 2>/dev/null)" 
	case "${NVM_CHECKSUM_BIN-}" in
		(sha256sum | shasum | sha256 | gsha256sum | openssl | bssl) nvm_echo 'sha-256' ;;
		(sha1sum | sha1) nvm_echo 'sha-1' ;;
		(*) nvm_get_checksum_binary
			return $? ;;
	esac
}
nvm_get_checksum_binary () {
	if nvm_has_non_aliased 'sha256sum'
	then
		nvm_echo 'sha256sum'
	elif nvm_has_non_aliased 'shasum'
	then
		nvm_echo 'shasum'
	elif nvm_has_non_aliased 'sha256'
	then
		nvm_echo 'sha256'
	elif nvm_has_non_aliased 'gsha256sum'
	then
		nvm_echo 'gsha256sum'
	elif nvm_has_non_aliased 'openssl'
	then
		nvm_echo 'openssl'
	elif nvm_has_non_aliased 'bssl'
	then
		nvm_echo 'bssl'
	elif nvm_has_non_aliased 'sha1sum'
	then
		nvm_echo 'sha1sum'
	elif nvm_has_non_aliased 'sha1'
	then
		nvm_echo 'sha1'
	else
		nvm_err 'Unaliased sha256sum, shasum, sha256, gsha256sum, openssl, or bssl not found.'
		nvm_err 'Unaliased sha1sum or sha1 not found.'
		return 1
	fi
}
nvm_get_colors () {
	local COLOR
	local SYS_COLOR
	local COLORS
	COLORS="${NVM_COLORS:-bygre}" 
	case $1 in
		(1) COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 1, 1); }')")  ;;
		(2) COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 2, 1); }')")  ;;
		(3) COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 3, 1); }')")  ;;
		(4) COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 4, 1); }')")  ;;
		(5) COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 5, 1); }')")  ;;
		(6) SYS_COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 2, 1); }')") 
			COLOR=$(nvm_echo "$SYS_COLOR" | command tr '0;' '1;')  ;;
		(*) nvm_err "Invalid color index, ${1-}"
			return 1 ;;
	esac
	nvm_echo "$COLOR"
}
nvm_get_default_packages () {
	local NVM_DEFAULT_PACKAGE_FILE
	NVM_DEFAULT_PACKAGE_FILE="${NVM_DIR}/default-packages" 
	if [ -f "${NVM_DEFAULT_PACKAGE_FILE}" ]
	then
		command awk -v filename="${NVM_DEFAULT_PACKAGE_FILE}" '
      /^[ \t]*#/ { next }                           # Skip lines that begin with #
      /^[ \t]*$/ { next }                           # Skip empty lines
      /[ \t]/ && !/^[ \t]*#/ {
        print "Only one package per line is allowed in `" filename "`. Please remove any lines with multiple space-separated values." > "/dev/stderr"
        err = 1
        exit 1
      }
      {
        if (NR > 1 && !prev_space) printf " "
        printf "%s", $0
        prev_space = 0
      }
    ' "${NVM_DEFAULT_PACKAGE_FILE}"
	fi
}
nvm_get_download_slug () {
	local FLAVOR
	case "${1-}" in
		(node | iojs) FLAVOR="${1}"  ;;
		(*) nvm_err 'supported flavors: node, iojs'
			return 1 ;;
	esac
	local KIND
	case "${2-}" in
		(binary | source) KIND="${2}"  ;;
		(*) nvm_err 'supported kinds: binary, source'
			return 2 ;;
	esac
	local VERSION
	VERSION="${3-}" 
	local NVM_OS
	NVM_OS="$(nvm_get_os)" 
	local NVM_ARCH
	NVM_ARCH="$(nvm_get_arch)" 
	if ! nvm_is_merged_node_version "${VERSION}"
	then
		if [ "${NVM_ARCH}" = 'armv6l' ] || [ "${NVM_ARCH}" = 'armv7l' ]
		then
			NVM_ARCH="arm-pi" 
		fi
	fi
	if nvm_version_greater '14.17.0' "${VERSION}" || (
			nvm_version_greater_than_or_equal_to "${VERSION}" '15.0.0' && nvm_version_greater '16.0.0' "${VERSION}"
		)
	then
		if [ "_${NVM_OS}" = '_darwin' ] && [ "${NVM_ARCH}" = 'arm64' ]
		then
			NVM_ARCH=x64 
		fi
	fi
	if [ "${KIND}" = 'binary' ]
	then
		nvm_echo "${FLAVOR}-${VERSION}-${NVM_OS}-${NVM_ARCH}"
	elif [ "${KIND}" = 'source' ]
	then
		nvm_echo "${FLAVOR}-${VERSION}"
	fi
}
nvm_get_latest () {
	local NVM_LATEST_URL
	local CURL_COMPRESSED_FLAG
	if nvm_has "curl"
	then
		if nvm_curl_use_compression
		then
			CURL_COMPRESSED_FLAG="--compressed" 
		fi
		NVM_LATEST_URL="$(curl ${CURL_COMPRESSED_FLAG:-} -q -w "%{url_effective}\\n" -L -s -S https://latest.nvm.sh -o /dev/null)" 
	elif nvm_has "wget"
	then
		NVM_LATEST_URL="$(wget -q https://latest.nvm.sh --server-response -O /dev/null 2>&1 | command awk '/^  Location: /{DEST=$2} END{ print DEST }')" 
	else
		nvm_err 'nvm needs curl or wget to proceed.'
		return 1
	fi
	if [ -z "${NVM_LATEST_URL}" ]
	then
		nvm_err "https://latest.nvm.sh did not redirect to the latest release on GitHub"
		return 2
	fi
	nvm_echo "${NVM_LATEST_URL##*/}"
}
nvm_get_make_jobs () {
	if nvm_is_natural_num "${1-}"
	then
		NVM_MAKE_JOBS="$1" 
		nvm_echo "number of \`make\` jobs: ${NVM_MAKE_JOBS}"
		return
	elif [ -n "${1-}" ]
	then
		unset NVM_MAKE_JOBS
		nvm_err "$1 is invalid for number of \`make\` jobs, must be a natural number"
	fi
	local NVM_OS
	NVM_OS="$(nvm_get_os)" 
	local NVM_CPU_CORES
	case "_${NVM_OS}" in
		("_linux") NVM_CPU_CORES="$(nvm_grep -c -E '^processor.+: [0-9]+' /proc/cpuinfo)"  ;;
		("_freebsd" | "_darwin" | "_openbsd") NVM_CPU_CORES="$(sysctl -n hw.ncpu)"  ;;
		("_sunos") NVM_CPU_CORES="$(psrinfo | wc -l)"  ;;
		("_aix") NVM_CPU_CORES="$(pmcycles -m | wc -l)"  ;;
	esac
	if ! nvm_is_natural_num "${NVM_CPU_CORES}"
	then
		nvm_err 'Can not determine how many core(s) are available, running in single-threaded mode.'
		nvm_err 'Please report an issue on GitHub to help us make nvm run faster on your computer!'
		NVM_MAKE_JOBS=1 
	else
		nvm_echo "Detected that you have ${NVM_CPU_CORES} CPU core(s)"
		if [ "${NVM_CPU_CORES}" -gt 2 ]
		then
			NVM_MAKE_JOBS=$((NVM_CPU_CORES - 1)) 
			nvm_echo "Running with ${NVM_MAKE_JOBS} threads to speed up the build"
		else
			NVM_MAKE_JOBS=1 
			nvm_echo 'Number of CPU core(s) less than or equal to 2, running in single-threaded mode'
		fi
	fi
}
nvm_get_minor_version () {
	local VERSION
	VERSION="$1" 
	if [ -z "${VERSION}" ]
	then
		nvm_err 'a version is required'
		return 1
	fi
	case "${VERSION}" in
		(v | .* | *..* | v*[!.0123456789]* | [!v]*[!.0123456789]* | [!v0123456789]* | v[!0123456789]*) nvm_err 'invalid version number'
			return 2 ;;
	esac
	local PREFIXED_VERSION
	PREFIXED_VERSION="$(nvm_format_version "${VERSION}")" 
	local MINOR
	MINOR="$(nvm_echo "${PREFIXED_VERSION}" | nvm_grep -e '^v' | command cut -c2- | command cut -d . -f 1,2)" 
	if [ -z "${MINOR}" ]
	then
		nvm_err 'invalid version number! (please report this)'
		return 3
	fi
	nvm_echo "${MINOR}"
}
nvm_get_mirror () {
	local NVM_MIRROR
	NVM_MIRROR='' 
	case "${1}-${2}" in
		(node-std) NVM_MIRROR="${NVM_NODEJS_ORG_MIRROR:-https://nodejs.org/dist}"  ;;
		(iojs-std) NVM_MIRROR="${NVM_IOJS_ORG_MIRROR:-https://iojs.org/dist}"  ;;
		(*) nvm_err 'unknown type of node.js or io.js release'
			return 1 ;;
	esac
	case "${NVM_MIRROR}" in
		(*\`* | *\\* | *\'* | *\(* | *' '*) nvm_err '$NVM_NODEJS_ORG_MIRROR and $NVM_IOJS_ORG_MIRROR may only contain a URL'
			return 2 ;;
	esac
	if ! nvm_echo "${NVM_MIRROR}" | command awk '{ $0 ~ "^https?://[a-zA-Z0-9./_-]+$" }'
	then
		nvm_err '$NVM_NODEJS_ORG_MIRROR and $NVM_IOJS_ORG_MIRROR may only contain a URL'
		return 2
	fi
	nvm_echo "${NVM_MIRROR}"
}
nvm_get_os () {
	local NVM_UNAME
	NVM_UNAME="$(command uname -a)" 
	local NVM_OS
	case "${NVM_UNAME}" in
		(Linux\ *) NVM_OS=linux  ;;
		(Darwin\ *) NVM_OS=darwin  ;;
		(SunOS\ *) NVM_OS=sunos  ;;
		(FreeBSD\ *) NVM_OS=freebsd  ;;
		(OpenBSD\ *) NVM_OS=openbsd  ;;
		(AIX\ *) NVM_OS=aix  ;;
		(CYGWIN* | MSYS* | MINGW*) NVM_OS=win  ;;
	esac
	nvm_echo "${NVM_OS-}"
}
nvm_grep () {
	GREP_OPTIONS='' command grep "$@"
}
nvm_has () {
	type "${1-}" > /dev/null 2>&1
}
nvm_has_colors () {
	local NVM_NUM_COLORS
	if nvm_has tput
	then
		NVM_NUM_COLORS="$(command tput -T "${TERM:-vt100}" colors)" 
	fi
	[ -t 1 ] && [ "${NVM_NUM_COLORS:--1}" -ge 8 ] && [ "${NVM_NO_COLORS-}" != '--no-colors' ]
}
nvm_has_non_aliased () {
	nvm_has "${1-}" && ! nvm_is_alias "${1-}"
}
nvm_has_solaris_binary () {
	local VERSION="${1-}" 
	if nvm_is_merged_node_version "${VERSION}"
	then
		return 0
	elif nvm_is_iojs_version "${VERSION}"
	then
		nvm_iojs_version_has_solaris_binary "${VERSION}"
	else
		nvm_node_version_has_solaris_binary "${VERSION}"
	fi
}
nvm_has_system_iojs () {
	[ "$(nvm deactivate >/dev/null 2>&1 && command -v iojs)" != '' ]
}
nvm_has_system_node () {
	[ "$(nvm deactivate >/dev/null 2>&1 && command -v node)" != '' ]
}
nvm_install_binary () {
	local FLAVOR
	case "${1-}" in
		(node | iojs) FLAVOR="${1}"  ;;
		(*) nvm_err 'supported flavors: node, iojs'
			return 4 ;;
	esac
	local TYPE
	TYPE="${2-}" 
	local PREFIXED_VERSION
	PREFIXED_VERSION="${3-}" 
	if [ -z "${PREFIXED_VERSION}" ]
	then
		nvm_err 'A version number is required.'
		return 3
	fi
	local nosource
	nosource="${4-}" 
	local VERSION
	VERSION="$(nvm_strip_iojs_prefix "${PREFIXED_VERSION}")" 
	local NVM_OS
	NVM_OS="$(nvm_get_os)" 
	if [ -z "${NVM_OS}" ]
	then
		return 2
	fi
	local TARBALL
	local TMPDIR
	local PROGRESS_BAR
	local NODE_OR_IOJS
	if [ "${FLAVOR}" = 'node' ]
	then
		NODE_OR_IOJS="${FLAVOR}" 
	elif [ "${FLAVOR}" = 'iojs' ]
	then
		NODE_OR_IOJS="io.js" 
	fi
	if [ "${NVM_NO_PROGRESS-}" = "1" ]
	then
		PROGRESS_BAR="-sS" 
	else
		PROGRESS_BAR="--progress-bar" 
	fi
	nvm_echo "Downloading and installing ${NODE_OR_IOJS-} ${VERSION}..."
	TARBALL="$(PROGRESS_BAR="${PROGRESS_BAR}" nvm_download_artifact "${FLAVOR}" binary "${TYPE-}" "${VERSION}" | command tail -1)" 
	if [ -f "${TARBALL}" ]
	then
		TMPDIR="$(dirname "${TARBALL}")/files" 
	fi
	if nvm_install_binary_extract "${NVM_OS}" "${PREFIXED_VERSION}" "${VERSION}" "${TARBALL}" "${TMPDIR}"
	then
		if [ -n "${ALIAS-}" ]
		then
			nvm alias "${ALIAS}" "${provided_version}"
		fi
		return 0
	fi
	if [ "${nosource-}" = '1' ]
	then
		nvm_err 'Binary download failed. Download from source aborted.'
		return 0
	fi
	nvm_err 'Binary download failed, trying source.'
	if [ -n "${TMPDIR-}" ]
	then
		command rm -rf "${TMPDIR}"
	fi
	return 1
}
nvm_install_binary_extract () {
	if [ "$#" -ne 5 ]
	then
		nvm_err 'nvm_install_binary_extract needs 5 parameters'
		return 1
	fi
	local NVM_OS
	local PREFIXED_VERSION
	local VERSION
	local TARBALL
	local TMPDIR
	NVM_OS="${1}" 
	PREFIXED_VERSION="${2}" 
	VERSION="${3}" 
	TARBALL="${4}" 
	TMPDIR="${5}" 
	local VERSION_PATH
	[ -n "${TMPDIR-}" ] && command mkdir -p "${TMPDIR}" && VERSION_PATH="$(nvm_version_path "${PREFIXED_VERSION}")"  || return 1
	if [ "${NVM_OS}" = 'win' ]
	then
		VERSION_PATH="${VERSION_PATH}/bin" 
		command unzip -q "${TARBALL}" -d "${TMPDIR}" || return 1
	else
		nvm_extract_tarball "${NVM_OS}" "${VERSION}" "${TARBALL}" "${TMPDIR}"
	fi
	command mkdir -p "${VERSION_PATH}" || return 1
	if [ "${NVM_OS}" = 'win' ]
	then
		command mv "${TMPDIR}/"*/* "${VERSION_PATH}/" || return 1
		command chmod +x "${VERSION_PATH}"/node.exe || return 1
		command chmod +x "${VERSION_PATH}"/npm || return 1
		command chmod +x "${VERSION_PATH}"/npx 2> /dev/null
	else
		command mv "${TMPDIR}/"* "${VERSION_PATH}" || return 1
	fi
	command rm -rf "${TMPDIR}"
	return 0
}
nvm_install_default_packages () {
	local DEFAULT_PACKAGES
	DEFAULT_PACKAGES="$(nvm_get_default_packages)" 
	EXIT_CODE=$? 
	if [ $EXIT_CODE -ne 0 ] || [ -z "${DEFAULT_PACKAGES}" ]
	then
		return $EXIT_CODE
	fi
	nvm_echo "Installing default global packages from ${NVM_DIR}/default-packages..."
	nvm_echo "npm install -g --quiet ${DEFAULT_PACKAGES}"
	if ! nvm_echo "${DEFAULT_PACKAGES}" | command xargs npm install -g --quiet
	then
		nvm_err "Failed installing default packages. Please check if your default-packages file or a package in it has problems!"
		return 1
	fi
}
nvm_install_latest_npm () {
	nvm_echo 'Attempting to upgrade to the latest working version of npm...'
	local NODE_VERSION
	NODE_VERSION="$(nvm_strip_iojs_prefix "$(nvm_ls_current)")" 
	local NPM_VERSION
	NPM_VERSION="$(npm --version 2>/dev/null)" 
	if [ "${NODE_VERSION}" = 'system' ]
	then
		NODE_VERSION="$(node --version)" 
	elif [ "${NODE_VERSION}" = 'none' ]
	then
		nvm_echo "Detected node version ${NODE_VERSION}, npm version v${NPM_VERSION}"
		NODE_VERSION='' 
	fi
	if [ -z "${NODE_VERSION}" ]
	then
		nvm_err 'Unable to obtain node version.'
		return 1
	fi
	if [ -z "${NPM_VERSION}" ]
	then
		nvm_err 'Unable to obtain npm version.'
		return 2
	fi
	local NVM_NPM_CMD
	NVM_NPM_CMD='npm' 
	if [ "${NVM_DEBUG-}" = 1 ]
	then
		nvm_echo "Detected node version ${NODE_VERSION}, npm version v${NPM_VERSION}"
		NVM_NPM_CMD='nvm_echo npm' 
	fi
	local NVM_IS_0_6
	NVM_IS_0_6=0 
	if nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 0.6.0 && nvm_version_greater 0.7.0 "${NODE_VERSION}"
	then
		NVM_IS_0_6=1 
	fi
	local NVM_IS_0_9
	NVM_IS_0_9=0 
	if nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 0.9.0 && nvm_version_greater 0.10.0 "${NODE_VERSION}"
	then
		NVM_IS_0_9=1 
	fi
	if [ $NVM_IS_0_6 -eq 1 ]
	then
		nvm_echo '* `node` v0.6.x can only upgrade to `npm` v1.3.x'
		$NVM_NPM_CMD install -g npm@1.3
	elif [ $NVM_IS_0_9 -eq 0 ]
	then
		if nvm_version_greater_than_or_equal_to "${NPM_VERSION}" 1.0.0 && nvm_version_greater 2.0.0 "${NPM_VERSION}"
		then
			nvm_echo '* `npm` v1.x needs to first jump to `npm` v1.4.28 to be able to upgrade further'
			$NVM_NPM_CMD install -g npm@1.4.28
		elif nvm_version_greater_than_or_equal_to "${NPM_VERSION}" 2.0.0 && nvm_version_greater 3.0.0 "${NPM_VERSION}"
		then
			nvm_echo '* `npm` v2.x needs to first jump to the latest v2 to be able to upgrade further'
			$NVM_NPM_CMD install -g npm@2
		fi
	fi
	if [ $NVM_IS_0_9 -eq 1 ] || [ $NVM_IS_0_6 -eq 1 ]
	then
		nvm_echo '* node v0.6 and v0.9 are unable to upgrade further'
	elif nvm_version_greater 1.1.0 "${NODE_VERSION}"
	then
		nvm_echo '* `npm` v4.5.x is the last version that works on `node` versions < v1.1.0'
		$NVM_NPM_CMD install -g npm@4.5
	elif nvm_version_greater 4.0.0 "${NODE_VERSION}"
	then
		nvm_echo '* `npm` v5 and higher do not work on `node` versions below v4.0.0'
		$NVM_NPM_CMD install -g npm@4
	elif [ $NVM_IS_0_9 -eq 0 ] && [ $NVM_IS_0_6 -eq 0 ]
	then
		local NVM_IS_4_4_OR_BELOW
		NVM_IS_4_4_OR_BELOW=0 
		if nvm_version_greater 4.5.0 "${NODE_VERSION}"
		then
			NVM_IS_4_4_OR_BELOW=1 
		fi
		local NVM_IS_5_OR_ABOVE
		NVM_IS_5_OR_ABOVE=0 
		if [ $NVM_IS_4_4_OR_BELOW -eq 0 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 5.0.0
		then
			NVM_IS_5_OR_ABOVE=1 
		fi
		local NVM_IS_6_OR_ABOVE
		NVM_IS_6_OR_ABOVE=0 
		local NVM_IS_6_2_OR_ABOVE
		NVM_IS_6_2_OR_ABOVE=0 
		if [ $NVM_IS_5_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 6.0.0
		then
			NVM_IS_6_OR_ABOVE=1 
			if nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 6.2.0
			then
				NVM_IS_6_2_OR_ABOVE=1 
			fi
		fi
		local NVM_IS_9_OR_ABOVE
		NVM_IS_9_OR_ABOVE=0 
		local NVM_IS_9_3_OR_ABOVE
		NVM_IS_9_3_OR_ABOVE=0 
		if [ $NVM_IS_6_2_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 9.0.0
		then
			NVM_IS_9_OR_ABOVE=1 
			if nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 9.3.0
			then
				NVM_IS_9_3_OR_ABOVE=1 
			fi
		fi
		local NVM_IS_10_OR_ABOVE
		NVM_IS_10_OR_ABOVE=0 
		if [ $NVM_IS_9_3_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 10.0.0
		then
			NVM_IS_10_OR_ABOVE=1 
		fi
		local NVM_IS_12_LTS_OR_ABOVE
		NVM_IS_12_LTS_OR_ABOVE=0 
		if [ $NVM_IS_10_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 12.13.0
		then
			NVM_IS_12_LTS_OR_ABOVE=1 
		fi
		local NVM_IS_13_OR_ABOVE
		NVM_IS_13_OR_ABOVE=0 
		if [ $NVM_IS_12_LTS_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 13.0.0
		then
			NVM_IS_13_OR_ABOVE=1 
		fi
		local NVM_IS_14_LTS_OR_ABOVE
		NVM_IS_14_LTS_OR_ABOVE=0 
		if [ $NVM_IS_13_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 14.15.0
		then
			NVM_IS_14_LTS_OR_ABOVE=1 
		fi
		local NVM_IS_14_17_OR_ABOVE
		NVM_IS_14_17_OR_ABOVE=0 
		if [ $NVM_IS_14_LTS_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 14.17.0
		then
			NVM_IS_14_17_OR_ABOVE=1 
		fi
		local NVM_IS_15_OR_ABOVE
		NVM_IS_15_OR_ABOVE=0 
		if [ $NVM_IS_14_LTS_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 15.0.0
		then
			NVM_IS_15_OR_ABOVE=1 
		fi
		local NVM_IS_16_OR_ABOVE
		NVM_IS_16_OR_ABOVE=0 
		if [ $NVM_IS_15_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 16.0.0
		then
			NVM_IS_16_OR_ABOVE=1 
		fi
		local NVM_IS_16_LTS_OR_ABOVE
		NVM_IS_16_LTS_OR_ABOVE=0 
		if [ $NVM_IS_16_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 16.13.0
		then
			NVM_IS_16_LTS_OR_ABOVE=1 
		fi
		local NVM_IS_17_OR_ABOVE
		NVM_IS_17_OR_ABOVE=0 
		if [ $NVM_IS_16_LTS_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 17.0.0
		then
			NVM_IS_17_OR_ABOVE=1 
		fi
		local NVM_IS_18_OR_ABOVE
		NVM_IS_18_OR_ABOVE=0 
		if [ $NVM_IS_17_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 18.0.0
		then
			NVM_IS_18_OR_ABOVE=1 
		fi
		local NVM_IS_18_17_OR_ABOVE
		NVM_IS_18_17_OR_ABOVE=0 
		if [ $NVM_IS_18_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 18.17.0
		then
			NVM_IS_18_17_OR_ABOVE=1 
		fi
		local NVM_IS_19_OR_ABOVE
		NVM_IS_19_OR_ABOVE=0 
		if [ $NVM_IS_18_17_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 19.0.0
		then
			NVM_IS_19_OR_ABOVE=1 
		fi
		local NVM_IS_20_5_OR_ABOVE
		NVM_IS_20_5_OR_ABOVE=0 
		if [ $NVM_IS_19_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 20.5.0
		then
			NVM_IS_20_5_OR_ABOVE=1 
		fi
		local NVM_IS_20_17_OR_ABOVE
		NVM_IS_20_17_OR_ABOVE=0 
		if [ $NVM_IS_20_5_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 20.17.0
		then
			NVM_IS_20_17_OR_ABOVE=1 
		fi
		local NVM_IS_21_OR_ABOVE
		NVM_IS_21_OR_ABOVE=0 
		if [ $NVM_IS_20_17_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 21.0.0
		then
			NVM_IS_21_OR_ABOVE=1 
		fi
		local NVM_IS_22_9_OR_ABOVE
		NVM_IS_22_9_OR_ABOVE=0 
		if [ $NVM_IS_21_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 22.9.0
		then
			NVM_IS_22_9_OR_ABOVE=1 
		fi
		if [ $NVM_IS_4_4_OR_BELOW -eq 1 ] || {
				[ $NVM_IS_5_OR_ABOVE -eq 1 ] && nvm_version_greater 5.10.0 "${NODE_VERSION}"
			}
		then
			nvm_echo '* `npm` `v5.3.x` is the last version that works on `node` 4.x versions below v4.4, or 5.x versions below v5.10, due to `Buffer.alloc`'
			$NVM_NPM_CMD install -g npm@5.3
		elif [ $NVM_IS_4_4_OR_BELOW -eq 0 ] && nvm_version_greater 4.7.0 "${NODE_VERSION}"
		then
			nvm_echo '* `npm` `v5.4.1` is the last version that works on `node` `v4.5` and `v4.6`'
			$NVM_NPM_CMD install -g npm@5.4.1
		elif [ $NVM_IS_6_OR_ABOVE -eq 0 ]
		then
			nvm_echo '* `npm` `v5.x` is the last version that works on `node` below `v6.0.0`'
			$NVM_NPM_CMD install -g npm@5
		elif {
				[ $NVM_IS_6_OR_ABOVE -eq 1 ] && [ $NVM_IS_6_2_OR_ABOVE -eq 0 ]
			} || {
				[ $NVM_IS_9_OR_ABOVE -eq 1 ] && [ $NVM_IS_9_3_OR_ABOVE -eq 0 ]
			}
		then
			nvm_echo '* `npm` `v6.9` is the last version that works on `node` `v6.0.x`, `v6.1.x`, `v9.0.x`, `v9.1.x`, or `v9.2.x`'
			$NVM_NPM_CMD install -g npm@6.9
		elif [ $NVM_IS_10_OR_ABOVE -eq 0 ]
		then
			if nvm_version_greater 4.4.4 "${NPM_VERSION}"
			then
				nvm_echo '* `npm` `v4.4.4` or later is required to install npm v6.14.18'
				$NVM_NPM_CMD install -g npm@4
			fi
			nvm_echo '* `npm` `v6.x` is the last version that works on `node` below `v10.0.0`'
			$NVM_NPM_CMD install -g npm@6
		elif [ $NVM_IS_12_LTS_OR_ABOVE -eq 0 ] || {
				[ $NVM_IS_13_OR_ABOVE -eq 1 ] && [ $NVM_IS_14_LTS_OR_ABOVE -eq 0 ]
			} || {
				[ $NVM_IS_15_OR_ABOVE -eq 1 ] && [ $NVM_IS_16_OR_ABOVE -eq 0 ]
			}
		then
			nvm_echo '* `npm` `v7.x` is the last version that works on `node` `v13`, `v15`, below `v12.13`, or `v14.0` - `v14.15`'
			$NVM_NPM_CMD install -g npm@7
		elif {
				[ $NVM_IS_12_LTS_OR_ABOVE -eq 1 ] && [ $NVM_IS_13_OR_ABOVE -eq 0 ]
			} || {
				[ $NVM_IS_14_LTS_OR_ABOVE -eq 1 ] && [ $NVM_IS_14_17_OR_ABOVE -eq 0 ]
			} || {
				[ $NVM_IS_16_OR_ABOVE -eq 1 ] && [ $NVM_IS_16_LTS_OR_ABOVE -eq 0 ]
			} || {
				[ $NVM_IS_17_OR_ABOVE -eq 1 ] && [ $NVM_IS_18_OR_ABOVE -eq 0 ]
			}
		then
			nvm_echo '* `npm` `v8.6` is the last version that works on `node` `v12`, `v14.13` - `v14.16`, or `v16.0` - `v16.12`'
			$NVM_NPM_CMD install -g npm@8.6
		elif [ $NVM_IS_18_17_OR_ABOVE -eq 0 ] || {
				[ $NVM_IS_19_OR_ABOVE -eq 1 ] && [ $NVM_IS_20_5_OR_ABOVE -eq 0 ]
			}
		then
			nvm_echo '* `npm` `v9.x` is the last version that works on `node` `< v18.17`, `v19`, or `v20.0` - `v20.4`'
			$NVM_NPM_CMD install -g npm@9
		elif [ $NVM_IS_20_17_OR_ABOVE -eq 0 ] || {
				[ $NVM_IS_21_OR_ABOVE -eq 1 ] && [ $NVM_IS_22_9_OR_ABOVE -eq 0 ]
			}
		then
			nvm_echo '* `npm` `v10.x` is the last version that works on `node` `< v20.17`, `v21`, or `v22.0` - `v22.8`'
			$NVM_NPM_CMD install -g npm@10
		else
			nvm_echo '* Installing latest `npm`; if this does not work on your node version, please report a bug!'
			$NVM_NPM_CMD install -g npm
		fi
	fi
	nvm_echo "* npm upgraded to: v$(npm --version 2>/dev/null)"
}
nvm_install_npm_if_needed () {
	local VERSION
	VERSION="$(nvm_ls_current)" 
	if ! nvm_has "npm"
	then
		nvm_echo 'Installing npm...'
		if nvm_version_greater 0.2.0 "${VERSION}"
		then
			nvm_err 'npm requires node v0.2.3 or higher'
		elif nvm_version_greater_than_or_equal_to "${VERSION}" 0.2.0
		then
			if nvm_version_greater 0.2.3 "${VERSION}"
			then
				nvm_err 'npm requires node v0.2.3 or higher'
			else
				nvm_download -L https://npmjs.org/install.sh -o - | clean=yes npm_install=0.2.19 sh
			fi
		else
			nvm_download -L https://npmjs.org/install.sh -o - | clean=yes sh
		fi
	fi
	return $?
}
nvm_install_source () {
	local FLAVOR
	case "${1-}" in
		(node | iojs) FLAVOR="${1}"  ;;
		(*) nvm_err 'supported flavors: node, iojs'
			return 4 ;;
	esac
	local TYPE
	TYPE="${2-}" 
	local PREFIXED_VERSION
	PREFIXED_VERSION="${3-}" 
	if [ -z "${PREFIXED_VERSION}" ]
	then
		nvm_err 'A version number is required.'
		return 3
	fi
	local VERSION
	VERSION="$(nvm_strip_iojs_prefix "${PREFIXED_VERSION}")" 
	local NVM_MAKE_JOBS
	NVM_MAKE_JOBS="${4-}" 
	local ADDITIONAL_PARAMETERS
	ADDITIONAL_PARAMETERS="${5-}" 
	local NVM_ARCH
	NVM_ARCH="$(nvm_get_arch)" 
	if [ "${NVM_ARCH}" = 'armv6l' ] || [ "${NVM_ARCH}" = 'armv7l' ]
	then
		if [ -n "${ADDITIONAL_PARAMETERS}" ]
		then
			ADDITIONAL_PARAMETERS="--without-snapshot ${ADDITIONAL_PARAMETERS}" 
		else
			ADDITIONAL_PARAMETERS='--without-snapshot' 
		fi
	fi
	if [ -n "${ADDITIONAL_PARAMETERS}" ]
	then
		nvm_echo "Additional options while compiling: ${ADDITIONAL_PARAMETERS}"
	fi
	local NVM_OS
	NVM_OS="$(nvm_get_os)" 
	local make
	local MAKE_CXX
	local MAKE_SHELL_OVERRIDE
	if nvm_version_greater "0.12.0" "${VERSION}"
	then
		MAKE_SHELL_OVERRIDE=' SHELL=/bin/sh' 
	fi
	make="make${MAKE_SHELL_OVERRIDE-}" 
	case "${NVM_OS}" in
		('freebsd' | 'openbsd') make="gmake${MAKE_SHELL_OVERRIDE-}" 
			MAKE_CXX="CC=${CC:-cc} CXX=${CXX:-c++}"  ;;
		('darwin') MAKE_CXX="CC=${CC:-cc} CXX=${CXX:-c++}"  ;;
		('aix') make="gmake${MAKE_SHELL_OVERRIDE-}"  ;;
	esac
	if nvm_has "clang++" && nvm_has "clang" && nvm_version_greater_than_or_equal_to "$(nvm_clang_version)" 3.5
	then
		if [ -z "${CC-}" ] || [ -z "${CXX-}" ]
		then
			nvm_echo "Clang v3.5+ detected! CC or CXX not specified, will use Clang as C/C++ compiler!"
			MAKE_CXX="CC=${CC:-cc} CXX=${CXX:-c++}" 
		fi
	fi
	local TARBALL
	local TMPDIR
	local VERSION_PATH
	if [ "${NVM_NO_PROGRESS-}" = "1" ]
	then
		PROGRESS_BAR="-sS" 
	else
		PROGRESS_BAR="--progress-bar" 
	fi
	nvm_is_zsh && setopt local_options shwordsplit
	TARBALL="$(PROGRESS_BAR="${PROGRESS_BAR}" nvm_download_artifact "${FLAVOR}" source "${TYPE}" "${VERSION}" | command tail -1)"  && [ -f "${TARBALL}" ] && TMPDIR="$(dirname "${TARBALL}")/files"  && if ! (
			command mkdir -p "${TMPDIR}" && nvm_extract_tarball "${NVM_OS}" "${VERSION}" "${TARBALL}" "${TMPDIR}" && VERSION_PATH="$(nvm_version_path "${PREFIXED_VERSION}")"  && nvm_cd "${TMPDIR}" && nvm_echo '$>'./configure --prefix="${VERSION_PATH}" $ADDITIONAL_PARAMETERS'<' && ./configure --prefix="${VERSION_PATH}" $ADDITIONAL_PARAMETERS && $make -j "${NVM_MAKE_JOBS}" ${MAKE_CXX-} && command rm -f "${VERSION_PATH}" 2> /dev/null && $make -j "${NVM_MAKE_JOBS}" ${MAKE_CXX-} install
		)
	then
		nvm_err "nvm: install ${VERSION} failed!"
		command rm -rf "${TMPDIR-}"
		return 1
	fi
}
nvm_iojs_prefix () {
	nvm_echo 'iojs'
}
nvm_iojs_version_has_solaris_binary () {
	local IOJS_VERSION
	IOJS_VERSION="$1" 
	local STRIPPED_IOJS_VERSION
	STRIPPED_IOJS_VERSION="$(nvm_strip_iojs_prefix "${IOJS_VERSION}")" 
	if [ "_${STRIPPED_IOJS_VERSION}" = "${IOJS_VERSION}" ]
	then
		return 1
	fi
	nvm_version_greater_than_or_equal_to "${STRIPPED_IOJS_VERSION}" v3.3.1
}
nvm_is_alias () {
	\alias "${1-}" > /dev/null 2>&1
}
nvm_is_iojs_version () {
	case "${1-}" in
		(iojs-*) return 0 ;;
	esac
	return 1
}
nvm_is_merged_node_version () {
	nvm_version_greater_than_or_equal_to "$1" v4.0.0
}
nvm_is_natural_num () {
	if [ -z "$1" ]
	then
		return 4
	fi
	case "$1" in
		(0) return 1 ;;
		(-*) return 3 ;;
		(*) [ "$1" -eq "$1" ] 2> /dev/null ;;
	esac
}
nvm_is_valid_version () {
	if nvm_validate_implicit_alias "${1-}" 2> /dev/null
	then
		return 0
	fi
	case "${1-}" in
		("$(nvm_iojs_prefix)" | "$(nvm_node_prefix)") return 0 ;;
		(*) local VERSION
			VERSION="$(nvm_strip_iojs_prefix "${1-}")" 
			nvm_version_greater_than_or_equal_to "${VERSION}" 0 ;;
	esac
}
nvm_is_version_installed () {
	if [ -z "${1-}" ]
	then
		return 1
	fi
	local NVM_NODE_BINARY
	NVM_NODE_BINARY='node' 
	if [ "_$(nvm_get_os)" = '_win' ]
	then
		NVM_NODE_BINARY='node.exe' 
	fi
	if [ -x "$(nvm_version_path "$1" 2>/dev/null)/bin/${NVM_NODE_BINARY}" ]
	then
		return 0
	fi
	return 1
}
nvm_is_zsh () {
	[ -n "${ZSH_VERSION-}" ]
}
nvm_list_aliases () {
	local ALIAS
	ALIAS="${1-}" 
	local NVM_CURRENT
	NVM_CURRENT="$(nvm_ls_current)" 
	local NVM_ALIAS_DIR
	NVM_ALIAS_DIR="$(nvm_alias_path)" 
	command mkdir -p "${NVM_ALIAS_DIR}/lts"
	if [ "${ALIAS}" != "${ALIAS#lts/}" ]
	then
		nvm_alias "${ALIAS}"
		return $?
	fi
	nvm_is_zsh && unsetopt local_options nomatch
	(
		local ALIAS_PATH
		for ALIAS_PATH in "${NVM_ALIAS_DIR}/${ALIAS}"*
		do
			NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_CURRENT="${NVM_CURRENT}" nvm_print_alias_path "${NVM_ALIAS_DIR}" "${ALIAS_PATH}" &
		done
		wait
	) | command sort
	(
		local ALIAS_NAME
		for ALIAS_NAME in "$(nvm_node_prefix)" "stable" "unstable" "$(nvm_iojs_prefix)"
		do
			{
				if [ ! -f "${NVM_ALIAS_DIR}/${ALIAS_NAME}" ] && {
						[ -z "${ALIAS}" ] || [ "${ALIAS_NAME}" = "${ALIAS}" ]
					}
				then
					NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_CURRENT="${NVM_CURRENT}" nvm_print_default_alias "${ALIAS_NAME}"
				fi
			} &
		done
		wait
	) | command sort
	(
		local LTS_ALIAS
		for ALIAS_PATH in "${NVM_ALIAS_DIR}/lts/${ALIAS}"*
		do
			{
				LTS_ALIAS="$(NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_LTS=true nvm_print_alias_path "${NVM_ALIAS_DIR}" "${ALIAS_PATH}")" 
				if [ -n "${LTS_ALIAS}" ]
				then
					nvm_echo "${LTS_ALIAS}"
				fi
			} &
		done
		wait
	) | command sort
	return
}
nvm_ls () {
	local PATTERN
	PATTERN="${1-}" 
	local VERSIONS
	VERSIONS='' 
	if [ "${PATTERN}" = 'current' ]
	then
		nvm_ls_current
		return
	fi
	local NVM_IOJS_PREFIX
	NVM_IOJS_PREFIX="$(nvm_iojs_prefix)" 
	local NVM_NODE_PREFIX
	NVM_NODE_PREFIX="$(nvm_node_prefix)" 
	local NVM_VERSION_DIR_IOJS
	NVM_VERSION_DIR_IOJS="$(nvm_version_dir "${NVM_IOJS_PREFIX}")" 
	local NVM_VERSION_DIR_NEW
	NVM_VERSION_DIR_NEW="$(nvm_version_dir new)" 
	local NVM_VERSION_DIR_OLD
	NVM_VERSION_DIR_OLD="$(nvm_version_dir old)" 
	case "${PATTERN}" in
		("${NVM_IOJS_PREFIX}" | "${NVM_NODE_PREFIX}") PATTERN="${PATTERN}-"  ;;
		(*) local ALIAS_TARGET
			ALIAS_TARGET="$(nvm_resolve_alias "${PATTERN}" 2>/dev/null || nvm_echo)" 
			if [ "_${ALIAS_TARGET}" = '_system' ] && (
					nvm_has_system_iojs || nvm_has_system_node
				)
			then
				local SYSTEM_VERSION
				SYSTEM_VERSION="$(nvm deactivate >/dev/null 2>&1 && node -v 2>/dev/null)" 
				if [ -n "${SYSTEM_VERSION}" ]
				then
					nvm_echo "system ${SYSTEM_VERSION}"
				else
					nvm_echo "system"
				fi
				return
			fi
			if nvm_resolve_local_alias "${PATTERN}"
			then
				return
			fi
			PATTERN="$(nvm_ensure_version_prefix "${PATTERN}")"  ;;
	esac
	if [ "${PATTERN}" = 'N/A' ]
	then
		return
	fi
	local NVM_PATTERN_STARTS_WITH_V
	case $PATTERN in
		(v*) NVM_PATTERN_STARTS_WITH_V=true  ;;
		(*) NVM_PATTERN_STARTS_WITH_V=false  ;;
	esac
	if [ $NVM_PATTERN_STARTS_WITH_V = true ] && [ "_$(nvm_num_version_groups "${PATTERN}")" = "_3" ]
	then
		if nvm_is_version_installed "${PATTERN}"
		then
			VERSIONS="${PATTERN}" 
		elif nvm_is_version_installed "$(nvm_add_iojs_prefix "${PATTERN}")"
		then
			VERSIONS="$(nvm_add_iojs_prefix "${PATTERN}")" 
		fi
	else
		case "${PATTERN}" in
			("${NVM_IOJS_PREFIX}-" | "${NVM_NODE_PREFIX}-" | "system")  ;;
			(*) local NUM_VERSION_GROUPS
				NUM_VERSION_GROUPS="$(nvm_num_version_groups "${PATTERN}")" 
				if [ "${NUM_VERSION_GROUPS}" = "2" ] || [ "${NUM_VERSION_GROUPS}" = "1" ]
				then
					PATTERN="${PATTERN%.}." 
				fi ;;
		esac
		nvm_is_zsh && setopt local_options shwordsplit
		nvm_is_zsh && unsetopt local_options markdirs
		local NVM_DIRS_TO_SEARCH1
		NVM_DIRS_TO_SEARCH1='' 
		local NVM_DIRS_TO_SEARCH2
		NVM_DIRS_TO_SEARCH2='' 
		local NVM_DIRS_TO_SEARCH3
		NVM_DIRS_TO_SEARCH3='' 
		local NVM_ADD_SYSTEM
		NVM_ADD_SYSTEM=false 
		if nvm_is_iojs_version "${PATTERN}"
		then
			NVM_DIRS_TO_SEARCH1="${NVM_VERSION_DIR_IOJS}" 
			PATTERN="$(nvm_strip_iojs_prefix "${PATTERN}")" 
			if nvm_has_system_iojs
			then
				NVM_ADD_SYSTEM=true 
			fi
		elif [ "${PATTERN}" = "${NVM_NODE_PREFIX}-" ]
		then
			NVM_DIRS_TO_SEARCH1="${NVM_VERSION_DIR_OLD}" 
			NVM_DIRS_TO_SEARCH2="${NVM_VERSION_DIR_NEW}" 
			PATTERN='' 
			if nvm_has_system_node
			then
				NVM_ADD_SYSTEM=true 
			fi
		else
			NVM_DIRS_TO_SEARCH1="${NVM_VERSION_DIR_OLD}" 
			NVM_DIRS_TO_SEARCH2="${NVM_VERSION_DIR_NEW}" 
			NVM_DIRS_TO_SEARCH3="${NVM_VERSION_DIR_IOJS}" 
			if nvm_has_system_iojs || nvm_has_system_node
			then
				NVM_ADD_SYSTEM=true 
			fi
		fi
		if ! [ -d "${NVM_DIRS_TO_SEARCH1}" ] || ! (
				command ls -1qA "${NVM_DIRS_TO_SEARCH1}" | nvm_grep -q .
			)
		then
			NVM_DIRS_TO_SEARCH1='' 
		fi
		if ! [ -d "${NVM_DIRS_TO_SEARCH2}" ] || ! (
				command ls -1qA "${NVM_DIRS_TO_SEARCH2}" | nvm_grep -q .
			)
		then
			NVM_DIRS_TO_SEARCH2="${NVM_DIRS_TO_SEARCH1}" 
		fi
		if ! [ -d "${NVM_DIRS_TO_SEARCH3}" ] || ! (
				command ls -1qA "${NVM_DIRS_TO_SEARCH3}" | nvm_grep -q .
			)
		then
			NVM_DIRS_TO_SEARCH3="${NVM_DIRS_TO_SEARCH2}" 
		fi
		local SEARCH_PATTERN
		if [ -z "${PATTERN}" ]
		then
			PATTERN='v' 
			SEARCH_PATTERN='.*' 
		else
			SEARCH_PATTERN="$(nvm_echo "${PATTERN}" | command sed 's#\.#\\\.#g; s|#|\\#|g')" 
		fi
		if [ -n "${NVM_DIRS_TO_SEARCH1}${NVM_DIRS_TO_SEARCH2}${NVM_DIRS_TO_SEARCH3}" ]
		then
			VERSIONS="$(command find "${NVM_DIRS_TO_SEARCH1}"/* "${NVM_DIRS_TO_SEARCH2}"/* "${NVM_DIRS_TO_SEARCH3}"/* -name . -o -type d -prune -o -path "${PATTERN}*" \
        | command sed -e "
            s#${NVM_VERSION_DIR_IOJS}/#versions/${NVM_IOJS_PREFIX}/#;
            s#^${NVM_DIR}/##;
            \\#^[^v]# d;
            \\#^versions\$# d;
            s#^versions/##;
            s#^v#${NVM_NODE_PREFIX}/v#;
            \\#${SEARCH_PATTERN}# !d;
          " \
          -e 's#^\([^/]\{1,\}\)/\(.*\)$#\2.\1#;' \
        | command sort -t. -u -k 1.2,1n -k 2,2n -k 3,3n \
        | command sed -e 's#\(.*\)\.\([^\.]\{1,\}\)$#\2-\1#;' \
                      -e "s#^${NVM_NODE_PREFIX}-##;" \
      )" 
		fi
	fi
	if [ "${NVM_ADD_SYSTEM-}" = true ]
	then
		local SYSTEM_VERSION
		SYSTEM_VERSION="$(nvm deactivate >/dev/null 2>&1 && node -v 2>/dev/null)" 
		case "${PATTERN}" in
			('' | v) if [ -n "${SYSTEM_VERSION}" ]
				then
					VERSIONS="${VERSIONS}
system ${SYSTEM_VERSION}" 
				else
					VERSIONS="${VERSIONS}
system" 
				fi ;;
			(system) if [ -n "${SYSTEM_VERSION}" ]
				then
					VERSIONS="system ${SYSTEM_VERSION}" 
				else
					VERSIONS="system" 
				fi ;;
		esac
	fi
	if [ -z "${VERSIONS}" ]
	then
		nvm_echo 'N/A'
		return 3
	fi
	nvm_echo "${VERSIONS}"
}
nvm_ls_current () {
	local NVM_LS_CURRENT_NODE_PATH
	if ! NVM_LS_CURRENT_NODE_PATH="$(command which node 2>/dev/null)" 
	then
		nvm_echo 'none'
	elif nvm_tree_contains_path "$(nvm_version_dir iojs)" "${NVM_LS_CURRENT_NODE_PATH}"
	then
		nvm_add_iojs_prefix "$(iojs --version 2>/dev/null)"
	elif nvm_tree_contains_path "${NVM_DIR}" "${NVM_LS_CURRENT_NODE_PATH}"
	then
		local VERSION
		VERSION="$(node --version 2>/dev/null)" 
		if [ "${VERSION}" = "v0.6.21-pre" ]
		then
			nvm_echo 'v0.6.21'
		else
			nvm_echo "${VERSION:-none}"
		fi
	else
		nvm_echo 'system'
	fi
}
nvm_ls_remote () {
	local PATTERN
	PATTERN="${1-}" 
	if nvm_validate_implicit_alias "${PATTERN}" 2> /dev/null
	then
		local IMPLICIT
		IMPLICIT="$(nvm_print_implicit_alias remote "${PATTERN}")" 
		if [ -z "${IMPLICIT-}" ] || [ "${IMPLICIT}" = 'N/A' ]
		then
			nvm_echo "N/A"
			return 3
		fi
		PATTERN="$(NVM_LTS="${NVM_LTS-}" nvm_ls_remote "${IMPLICIT}" | command tail -1 | command awk '{ print $1 }')" 
	elif [ -n "${PATTERN}" ]
	then
		PATTERN="$(nvm_ensure_version_prefix "${PATTERN}")" 
	else
		PATTERN=".*" 
	fi
	NVM_LTS="${NVM_LTS-}" nvm_ls_remote_index_tab node std "${PATTERN}"
}
nvm_ls_remote_index_tab () {
	local LTS
	LTS="${NVM_LTS-}" 
	if [ "$#" -lt 3 ]
	then
		nvm_err 'not enough arguments'
		return 5
	fi
	local FLAVOR
	FLAVOR="${1-}" 
	local TYPE
	TYPE="${2-}" 
	local MIRROR
	MIRROR="$(nvm_get_mirror "${FLAVOR}" "${TYPE}")" 
	if [ -z "${MIRROR}" ]
	then
		return 3
	fi
	local PREFIX
	PREFIX='' 
	case "${FLAVOR}-${TYPE}" in
		(iojs-std) PREFIX="$(nvm_iojs_prefix)-"  ;;
		(node-std) PREFIX=''  ;;
		(iojs-*) nvm_err 'unknown type of io.js release'
			return 4 ;;
		(*) nvm_err 'unknown type of node.js release'
			return 4 ;;
	esac
	local SORT_COMMAND
	SORT_COMMAND='command sort' 
	case "${FLAVOR}" in
		(node) SORT_COMMAND='command sort -t. -u -k 1.2,1n -k 2,2n -k 3,3n'  ;;
	esac
	local PATTERN
	PATTERN="${3-}" 
	if [ "${PATTERN#"${PATTERN%?}"}" = '.' ]
	then
		PATTERN="${PATTERN%.}" 
	fi
	local VERSIONS
	if [ -n "${PATTERN}" ] && [ "${PATTERN}" != '*' ]
	then
		if [ "${FLAVOR}" = 'iojs' ]
		then
			PATTERN="$(nvm_ensure_version_prefix "$(nvm_strip_iojs_prefix "${PATTERN}")")" 
		else
			PATTERN="$(nvm_ensure_version_prefix "${PATTERN}")" 
		fi
	else
		unset PATTERN
	fi
	nvm_is_zsh && setopt local_options shwordsplit
	local VERSION_LIST
	VERSION_LIST="$(nvm_download -L -s "${MIRROR}/index.tab" -o - \
    | command sed "
        1d;
        s/^/${PREFIX}/;
      " \
  )" 
	local LTS_ALIAS
	local LTS_VERSION
	command mkdir -p "$(nvm_alias_path)/lts"
	{
		command awk '{
        if ($10 ~ /^\-?$/) { next }
        if ($10 && !a[tolower($10)]++) {
          if (alias) { print alias, version }
          alias_name = "lts/" tolower($10)
          if (!alias) { print "lts/*", alias_name }
          alias = alias_name
          version = $1
        }
      }
      END {
        if (alias) {
          print alias, version
        }
      }' | while read -r LTS_ALIAS_LINE
		do
			LTS_ALIAS="${LTS_ALIAS_LINE%% *}" 
			LTS_VERSION="${LTS_ALIAS_LINE#* }" 
			nvm_make_alias "${LTS_ALIAS}" "${LTS_VERSION}" > /dev/null 2>&1
		done
	} <<EOF
$VERSION_LIST
EOF
	if [ -n "${LTS-}" ]
	then
		if ! LTS="$(nvm_normalize_lts "lts/${LTS}")" 
		then
			return $?
		fi
		LTS="${LTS#lts/}" 
	fi
	VERSIONS="$( { command awk -v lts="${LTS-}" '{
        if (!$1) { next }
        if (lts && $10 ~ /^\-?$/) { next }
        if (lts && lts != "*" && tolower($10) !~ tolower(lts)) { next }
        if ($10 !~ /^\-?$/) {
          if ($10 && $10 != prev) {
            print $1, $10, "*"
          } else {
            print $1, $10
          }
        } else {
          print $1
        }
        prev=$10;
      }' \
    | nvm_grep -w "${PATTERN:-.*}" \
    | $SORT_COMMAND; } << EOF
$VERSION_LIST
EOF
)" 
	if [ -z "${VERSIONS}" ]
	then
		nvm_echo 'N/A'
		return 3
	fi
	nvm_echo "${VERSIONS}"
}
nvm_ls_remote_iojs () {
	NVM_LTS="${NVM_LTS-}" nvm_ls_remote_index_tab iojs std "${1-}"
}
nvm_make_alias () {
	local ALIAS
	ALIAS="${1-}" 
	if [ -z "${ALIAS}" ]
	then
		nvm_err "an alias name is required"
		return 1
	fi
	local VERSION
	VERSION="${2-}" 
	if [ -z "${VERSION}" ]
	then
		nvm_err "an alias target version is required"
		return 2
	fi
	nvm_echo "${VERSION}" | tee "$(nvm_alias_path)/${ALIAS}" > /dev/null
}
nvm_match_version () {
	local NVM_IOJS_PREFIX
	NVM_IOJS_PREFIX="$(nvm_iojs_prefix)" 
	local PROVIDED_VERSION
	PROVIDED_VERSION="$1" 
	case "_${PROVIDED_VERSION}" in
		("_${NVM_IOJS_PREFIX}" | '_io.js') nvm_version "${NVM_IOJS_PREFIX}" ;;
		('_system') nvm_echo 'system' ;;
		(*) nvm_version "${PROVIDED_VERSION}" ;;
	esac
}
nvm_node_prefix () {
	nvm_echo 'node'
}
nvm_node_version_has_solaris_binary () {
	local NODE_VERSION
	NODE_VERSION="$1" 
	local STRIPPED_IOJS_VERSION
	STRIPPED_IOJS_VERSION="$(nvm_strip_iojs_prefix "${NODE_VERSION}")" 
	if [ "_${STRIPPED_IOJS_VERSION}" != "_${NODE_VERSION}" ]
	then
		return 1
	fi
	nvm_version_greater_than_or_equal_to "${NODE_VERSION}" v0.8.6 && ! nvm_version_greater_than_or_equal_to "${NODE_VERSION}" v1.0.0
}
nvm_normalize_lts () {
	local LTS
	LTS="${1-}" 
	case "${LTS}" in
		(lts/-[123456789] | lts/-[123456789][0123456789]*) local N
			N="$(echo "${LTS}" | cut -d '-' -f 2)" 
			N=$((N+1)) 
			if [ $? -ne 0 ]
			then
				nvm_echo "${LTS}"
				return 0
			fi
			local NVM_ALIAS_DIR
			NVM_ALIAS_DIR="$(nvm_alias_path)" 
			local RESULT
			RESULT="$(command ls "${NVM_ALIAS_DIR}/lts" | command tail -n "${N}" | command head -n 1)" 
			if [ "${RESULT}" != '*' ]
			then
				nvm_echo "lts/${RESULT}"
			else
				nvm_err 'That many LTS releases do not exist yet.'
				return 2
			fi ;;
		(*) if [ "${LTS}" != "$(echo "${LTS}" | command tr '[:upper:]' '[:lower:]')" ]
			then
				nvm_err 'LTS names must be lowercase'
				return 3
			fi
			nvm_echo "${LTS}" ;;
	esac
}
nvm_normalize_version () {
	command awk 'BEGIN {
    split(ARGV[1], a, /\./);
    printf "%d%06d%06d\n", a[1], a[2], a[3];
    exit;
  }' "${1#v}"
}
nvm_npm_global_modules () {
	local NPMLIST
	local VERSION
	VERSION="$1" 
	NPMLIST=$(nvm use "${VERSION}" >/dev/null && npm list -g --depth=0 2>/dev/null | command sed -e '1d' -e '/UNMET PEER DEPENDENCY/d') 
	local INSTALLS
	INSTALLS=$(nvm_echo "${NPMLIST}" | command sed -e '/ -> / d' -e '/\(empty\)/ d' -e 's/^.* \(.*@[^ ]*\).*/\1/' -e '/^npm@[^ ]*.*$/ d' -e '/^corepack@[^ ]*.*$/ d' | command xargs) 
	local LINKS
	LINKS="$(nvm_echo "${NPMLIST}" | command sed -n 's/.* -> \(.*\)/\1/ p')" 
	nvm_echo "${INSTALLS} //// ${LINKS}"
}
nvm_npmrc_bad_news_bears () {
	local NVM_NPMRC
	NVM_NPMRC="${1-}" 
	if [ -n "${NVM_NPMRC}" ] && [ -f "${NVM_NPMRC}" ] && nvm_grep -Ee '^(prefix|globalconfig) *=' < "${NVM_NPMRC}" > /dev/null
	then
		return 0
	fi
	return 1
}
nvm_num_version_groups () {
	local VERSION
	VERSION="${1-}" 
	VERSION="${VERSION#v}" 
	VERSION="${VERSION%.}" 
	if [ -z "${VERSION}" ]
	then
		nvm_echo "0"
		return
	fi
	local NVM_NUM_DOTS
	NVM_NUM_DOTS=$(nvm_echo "${VERSION}" | command sed -e 's/[^\.]//g') 
	local NVM_NUM_GROUPS
	NVM_NUM_GROUPS=".${NVM_NUM_DOTS}" 
	nvm_echo "${#NVM_NUM_GROUPS}"
}
nvm_nvmrc_invalid_msg () {
	local error_text
	error_text="invalid .nvmrc!
all non-commented content (anything after # is a comment) must be either:
  - a single bare nvm-recognized version-ish
  - or, multiple distinct key-value pairs, each key/value separated by a single equals sign (=)

additionally, a single bare nvm-recognized version-ish must be present (after stripping comments)." 
	local warn_text
	warn_text="non-commented content parsed:
${1}" 
	nvm_err "$(nvm_wrap_with_color_code 'r' "${error_text}")

$(nvm_wrap_with_color_code 'y' "${warn_text}")"
}
nvm_print_alias_path () {
	local NVM_ALIAS_DIR
	NVM_ALIAS_DIR="${1-}" 
	if [ -z "${NVM_ALIAS_DIR}" ]
	then
		nvm_err 'An alias dir is required.'
		return 1
	fi
	local ALIAS_PATH
	ALIAS_PATH="${2-}" 
	if [ -z "${ALIAS_PATH}" ]
	then
		nvm_err 'An alias path is required.'
		return 2
	fi
	local ALIAS
	ALIAS="${ALIAS_PATH##"${NVM_ALIAS_DIR}"\/}" 
	local DEST
	DEST="$(nvm_alias "${ALIAS}" 2>/dev/null)"  || :
	if [ -n "${DEST}" ]
	then
		NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_LTS="${NVM_LTS-}" DEFAULT=false nvm_print_formatted_alias "${ALIAS}" "${DEST}"
	fi
}
nvm_print_color_code () {
	case "${1-}" in
		('0') return 0 ;;
		('r') nvm_echo '0;31m' ;;
		('R') nvm_echo '1;31m' ;;
		('g') nvm_echo '0;32m' ;;
		('G') nvm_echo '1;32m' ;;
		('b') nvm_echo '0;34m' ;;
		('B') nvm_echo '1;34m' ;;
		('c') nvm_echo '0;36m' ;;
		('C') nvm_echo '1;36m' ;;
		('m') nvm_echo '0;35m' ;;
		('M') nvm_echo '1;35m' ;;
		('y') nvm_echo '0;33m' ;;
		('Y') nvm_echo '1;33m' ;;
		('k') nvm_echo '0;30m' ;;
		('K') nvm_echo '1;30m' ;;
		('e') nvm_echo '0;37m' ;;
		('W') nvm_echo '1;37m' ;;
		(*) nvm_err "Invalid color code: ${1-}"
			return 1 ;;
	esac
}
nvm_print_default_alias () {
	local ALIAS
	ALIAS="${1-}" 
	if [ -z "${ALIAS}" ]
	then
		nvm_err 'A default alias is required.'
		return 1
	fi
	local DEST
	DEST="$(nvm_print_implicit_alias local "${ALIAS}")" 
	if [ -n "${DEST}" ]
	then
		NVM_NO_COLORS="${NVM_NO_COLORS-}" DEFAULT=true nvm_print_formatted_alias "${ALIAS}" "${DEST}"
	fi
}
nvm_print_formatted_alias () {
	local ALIAS
	ALIAS="${1-}" 
	local DEST
	DEST="${2-}" 
	local VERSION
	VERSION="${3-}" 
	if [ -z "${VERSION}" ]
	then
		VERSION="$(nvm_version "${DEST}")"  || :
	fi
	local VERSION_FORMAT
	local ALIAS_FORMAT
	local DEST_FORMAT
	local INSTALLED_COLOR
	local SYSTEM_COLOR
	local CURRENT_COLOR
	local NOT_INSTALLED_COLOR
	local DEFAULT_COLOR
	local LTS_COLOR
	INSTALLED_COLOR=$(nvm_get_colors 1) 
	SYSTEM_COLOR=$(nvm_get_colors 2) 
	CURRENT_COLOR=$(nvm_get_colors 3) 
	NOT_INSTALLED_COLOR=$(nvm_get_colors 4) 
	DEFAULT_COLOR=$(nvm_get_colors 5) 
	LTS_COLOR=$(nvm_get_colors 6) 
	ALIAS_FORMAT='%s' 
	DEST_FORMAT='%s' 
	VERSION_FORMAT='%s' 
	local NEWLINE
	NEWLINE='\n' 
	if [ "_${DEFAULT}" = '_true' ]
	then
		NEWLINE=' (default)\n' 
	fi
	local ARROW
	ARROW='->' 
	if nvm_has_colors
	then
		ARROW='\033[0;90m->\033[0m' 
		if [ "_${DEFAULT}" = '_true' ]
		then
			NEWLINE=" \033[${DEFAULT_COLOR}(default)\033[0m\n" 
		fi
		if [ "_${VERSION}" = "_${NVM_CURRENT-}" ]
		then
			ALIAS_FORMAT="\033[${CURRENT_COLOR}%s\033[0m" 
			DEST_FORMAT="\033[${CURRENT_COLOR}%s\033[0m" 
			VERSION_FORMAT="\033[${CURRENT_COLOR}%s\033[0m" 
		elif nvm_is_version_installed "${VERSION}"
		then
			ALIAS_FORMAT="\033[${INSTALLED_COLOR}%s\033[0m" 
			DEST_FORMAT="\033[${INSTALLED_COLOR}%s\033[0m" 
			VERSION_FORMAT="\033[${INSTALLED_COLOR}%s\033[0m" 
		elif [ "${VERSION}" = '∞' ] || [ "${VERSION}" = 'N/A' ]
		then
			ALIAS_FORMAT="\033[${NOT_INSTALLED_COLOR}%s\033[0m" 
			DEST_FORMAT="\033[${NOT_INSTALLED_COLOR}%s\033[0m" 
			VERSION_FORMAT="\033[${NOT_INSTALLED_COLOR}%s\033[0m" 
		fi
		if [ "_${NVM_LTS-}" = '_true' ]
		then
			ALIAS_FORMAT="\033[${LTS_COLOR}%s\033[0m" 
		fi
		if [ "_${DEST%/*}" = "_lts" ]
		then
			DEST_FORMAT="\033[${LTS_COLOR}%s\033[0m" 
		fi
	elif [ "_${VERSION}" != '_∞' ] && [ "_${VERSION}" != '_N/A' ]
	then
		VERSION_FORMAT='%s *' 
	fi
	if [ "${DEST}" = "${VERSION}" ]
	then
		command printf -- "${ALIAS_FORMAT} ${ARROW} ${VERSION_FORMAT}${NEWLINE}" "${ALIAS}" "${DEST}"
	else
		command printf -- "${ALIAS_FORMAT} ${ARROW} ${DEST_FORMAT} (${ARROW} ${VERSION_FORMAT})${NEWLINE}" "${ALIAS}" "${DEST}" "${VERSION}"
	fi
}
nvm_print_implicit_alias () {
	if [ "_$1" != "_local" ] && [ "_$1" != "_remote" ]
	then
		nvm_err "nvm_print_implicit_alias must be specified with local or remote as the first argument."
		return 1
	fi
	local NVM_IMPLICIT
	NVM_IMPLICIT="$2" 
	if ! nvm_validate_implicit_alias "${NVM_IMPLICIT}"
	then
		return 2
	fi
	local NVM_IOJS_PREFIX
	NVM_IOJS_PREFIX="$(nvm_iojs_prefix)" 
	local NVM_NODE_PREFIX
	NVM_NODE_PREFIX="$(nvm_node_prefix)" 
	local NVM_COMMAND
	local NVM_ADD_PREFIX_COMMAND
	local LAST_TWO
	case "${NVM_IMPLICIT}" in
		("${NVM_IOJS_PREFIX}") NVM_COMMAND="nvm_ls_remote_iojs" 
			NVM_ADD_PREFIX_COMMAND="nvm_add_iojs_prefix" 
			if [ "_$1" = "_local" ]
			then
				NVM_COMMAND="nvm_ls ${NVM_IMPLICIT}" 
			fi
			nvm_is_zsh && setopt local_options shwordsplit
			local NVM_IOJS_VERSION
			local EXIT_CODE
			NVM_IOJS_VERSION="$(${NVM_COMMAND})"  && :
			EXIT_CODE="$?" 
			if [ "_${EXIT_CODE}" = "_0" ]
			then
				NVM_IOJS_VERSION="$(nvm_echo "${NVM_IOJS_VERSION}" | command sed "s/^${NVM_IMPLICIT}-//" | nvm_grep -e '^v' | command cut -c2- | command cut -d . -f 1,2 | uniq | command tail -1)" 
			fi
			if [ "_$NVM_IOJS_VERSION" = "_N/A" ]
			then
				nvm_echo 'N/A'
			else
				${NVM_ADD_PREFIX_COMMAND} "${NVM_IOJS_VERSION}"
			fi
			return $EXIT_CODE ;;
		("${NVM_NODE_PREFIX}") nvm_echo 'stable'
			return ;;
		(*) NVM_COMMAND="nvm_ls_remote" 
			if [ "_$1" = "_local" ]
			then
				NVM_COMMAND="nvm_ls node" 
			fi
			nvm_is_zsh && setopt local_options shwordsplit
			LAST_TWO=$($NVM_COMMAND | nvm_grep -e '^v' | command cut -c2- | command cut -d . -f 1,2 | uniq)  ;;
	esac
	local MINOR
	local STABLE
	local UNSTABLE
	local MOD
	local NORMALIZED_VERSION
	nvm_is_zsh && setopt local_options shwordsplit
	for MINOR in $LAST_TWO
	do
		NORMALIZED_VERSION="$(nvm_normalize_version "$MINOR")" 
		if [ "_0${NORMALIZED_VERSION#?}" != "_$NORMALIZED_VERSION" ]
		then
			STABLE="$MINOR" 
		else
			MOD="$(awk 'BEGIN { print int(ARGV[1] / 1000000) % 2 ; exit(0) }' "${NORMALIZED_VERSION}")" 
			if [ "${MOD}" -eq 0 ]
			then
				STABLE="${MINOR}" 
			elif [ "${MOD}" -eq 1 ]
			then
				UNSTABLE="${MINOR}" 
			fi
		fi
	done
	if [ "_$2" = '_stable' ]
	then
		nvm_echo "${STABLE}"
	elif [ "_$2" = '_unstable' ]
	then
		nvm_echo "${UNSTABLE:-"N/A"}"
	fi
}
nvm_print_npm_version () {
	if nvm_has "npm"
	then
		local NPM_VERSION
		NPM_VERSION="$(npm --version 2>/dev/null)" 
		if [ -n "${NPM_VERSION}" ]
		then
			command printf " (npm v${NPM_VERSION})"
		fi
	fi
}
nvm_print_versions () {
	local NVM_CURRENT
	NVM_CURRENT=$(nvm_ls_current) 
	local INSTALLED_COLOR
	local SYSTEM_COLOR
	local CURRENT_COLOR
	local NOT_INSTALLED_COLOR
	local DEFAULT_COLOR
	local LTS_COLOR
	local NVM_HAS_COLORS
	NVM_HAS_COLORS=0 
	INSTALLED_COLOR=$(nvm_get_colors 1) 
	SYSTEM_COLOR=$(nvm_get_colors 2) 
	CURRENT_COLOR=$(nvm_get_colors 3) 
	NOT_INSTALLED_COLOR=$(nvm_get_colors 4) 
	DEFAULT_COLOR=$(nvm_get_colors 5) 
	LTS_COLOR=$(nvm_get_colors 6) 
	if nvm_has_colors
	then
		NVM_HAS_COLORS=1 
	fi
	command awk -v remote_versions="$(printf '%s' "${1-}" | tr '\n' '|')" -v installed_versions="$(nvm_ls | tr '\n' '|')" -v current="$NVM_CURRENT" -v installed_color="$INSTALLED_COLOR" -v system_color="$SYSTEM_COLOR" -v current_color="$CURRENT_COLOR" -v default_color="$DEFAULT_COLOR" -v old_lts_color="$DEFAULT_COLOR" -v has_colors="$NVM_HAS_COLORS" '
function alen(arr, i, len) { len=0; for(i in arr) len++; return len; }
BEGIN {
  fmt_installed = has_colors ? (installed_color ? "\033[" installed_color "%15s\033[0m" : "%15s") : "%15s *";
  fmt_system = has_colors ? (system_color ? "\033[" system_color "%15s\033[0m" : "%15s") : "%15s *";
  fmt_current = has_colors ? (current_color ? "\033[" current_color "->%13s\033[0m" : "%15s") : "->%13s *";

  latest_lts_color = current_color;
  sub(/0;/, "1;", latest_lts_color);

  fmt_latest_lts = has_colors && latest_lts_color ? ("\033[" latest_lts_color " (Latest LTS: %s)\033[0m") : " (Latest LTS: %s)";
  fmt_old_lts = has_colors && old_lts_color ? ("\033[" old_lts_color " (LTS: %s)\033[0m") : " (LTS: %s)";
  fmt_system_target = has_colors && system_color ? (" (\033[" system_color "-> %s\033[0m)") : " (-> %s)";

  split(remote_versions, lines, "|");
  split(installed_versions, installed, "|");
  rows = alen(lines);

  for (n = 1; n <= rows; n++) {
    split(lines[n], fields, "[[:blank:]]+");
    cols = alen(fields);
    version = fields[1];
    is_installed = 0;

    for (i in installed) {
      if (version == installed[i]) {
        is_installed = 1;
        break;
      }
    }

    fmt_version = "%15s";
    if (version == current) {
      fmt_version = fmt_current;
    } else if (version == "system") {
      fmt_version = fmt_system;
    } else if (is_installed) {
      fmt_version = fmt_installed;
    }

    padding = (!has_colors && is_installed) ? "" : "  ";

    if (cols == 1) {
      formatted = sprintf(fmt_version, version);
    } else if (version == "system" && cols >= 2) {
      formatted = sprintf((fmt_version fmt_system_target), version, fields[2]);
    } else if (cols == 2) {
      formatted = sprintf((fmt_version padding fmt_old_lts), version, fields[2]);
    } else if (cols == 3 && fields[3] == "*") {
      formatted = sprintf((fmt_version padding fmt_latest_lts), version, fields[2]);
    }

    output[n] = formatted;
  }

  for (n = 1; n <= rows; n++) {
    print output[n]
  }

  exit
}'
}
nvm_process_nvmrc () {
	local NVMRC_PATH
	NVMRC_PATH="$1" 
	local lines
	lines=$(command sed 's/#.*//' "$NVMRC_PATH" | command sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | nvm_grep -v '^$') 
	if [ -z "$lines" ]
	then
		nvm_nvmrc_invalid_msg "${lines}"
		return 1
	fi
	local keys
	keys='' 
	local values
	values='' 
	local unpaired_line
	unpaired_line='' 
	while IFS= read -r line
	do
		if [ -z "${line}" ]
		then
			continue
		elif [ -z "${line%%=*}" ]
		then
			if [ -n "${unpaired_line}" ]
			then
				nvm_nvmrc_invalid_msg "${lines}"
				return 1
			fi
			unpaired_line="${line}" 
		elif case "$line" in
				(*'='*) true ;;
				(*) false ;;
			esac
		then
			key="${line%%=*}" 
			value="${line#*=}" 
			key=$(nvm_echo "${key}" | command sed 's/^[[:space:]]*//;s/[[:space:]]*$//') 
			value=$(nvm_echo "${value}" | command sed 's/^[[:space:]]*//;s/[[:space:]]*$//') 
			if [ "${key}" = 'node' ]
			then
				nvm_nvmrc_invalid_msg "${lines}"
				return 1
			fi
			if nvm_echo "${keys}" | nvm_grep -q -E "(^| )${key}( |$)"
			then
				nvm_nvmrc_invalid_msg "${lines}"
				return 1
			fi
			keys="${keys} ${key}" 
			values="${values} ${value}" 
		else
			if [ -n "${unpaired_line}" ]
			then
				nvm_nvmrc_invalid_msg "${lines}"
				return 1
			fi
			unpaired_line="${line}" 
		fi
	done <<EOF
$lines
EOF
	if [ -z "${unpaired_line}" ]
	then
		nvm_nvmrc_invalid_msg "${lines}"
		return 1
	fi
	nvm_echo "${unpaired_line}"
}
nvm_process_parameters () {
	local NVM_AUTO_MODE
	NVM_AUTO_MODE='use' 
	while [ "$#" -ne 0 ]
	do
		case "$1" in
			(--install) NVM_AUTO_MODE='install'  ;;
			(--no-use) NVM_AUTO_MODE='none'  ;;
		esac
		shift
	done
	nvm_auto "${NVM_AUTO_MODE}"
}
nvm_rc_version () {
	export NVM_RC_VERSION='' 
	local NVMRC_PATH
	NVMRC_PATH="$(nvm_find_nvmrc)" 
	if [ ! -e "${NVMRC_PATH}" ]
	then
		if [ "${NVM_SILENT:-0}" -ne 1 ]
		then
			nvm_err "No .nvmrc file found"
		fi
		return 1
	fi
	if ! NVM_RC_VERSION="$(nvm_process_nvmrc "${NVMRC_PATH}")" 
	then
		return 1
	fi
	if [ -z "${NVM_RC_VERSION}" ]
	then
		if [ "${NVM_SILENT:-0}" -ne 1 ]
		then
			nvm_err "Warning: empty .nvmrc file found at \"${NVMRC_PATH}\""
		fi
		return 2
	fi
	if [ "${NVM_SILENT:-0}" -ne 1 ]
	then
		nvm_echo "Found '${NVMRC_PATH}' with version <${NVM_RC_VERSION}>"
	fi
}
nvm_remote_version () {
	local PATTERN
	PATTERN="${1-}" 
	local VERSION
	if nvm_validate_implicit_alias "${PATTERN}" 2> /dev/null
	then
		case "${PATTERN}" in
			("$(nvm_iojs_prefix)") VERSION="$(NVM_LTS="${NVM_LTS-}" nvm_ls_remote_iojs | command tail -1)"  && : ;;
			(*) VERSION="$(NVM_LTS="${NVM_LTS-}" nvm_ls_remote "${PATTERN}")"  && : ;;
		esac
	else
		VERSION="$(NVM_LTS="${NVM_LTS-}" nvm_remote_versions "${PATTERN}" | command tail -1)" 
	fi
	if [ -n "${PATTERN}" ] && [ "_${VERSION}" != "_N/A" ] && ! nvm_validate_implicit_alias "${PATTERN}" 2> /dev/null
	then
		local VERSION_NUM
		VERSION_NUM="$(nvm_echo "${VERSION}" | command awk '{print $1}')" 
		if ! nvm_echo "${VERSION_NUM}" | nvm_grep -q "${PATTERN}"
		then
			VERSION='N/A' 
		fi
	fi
	if [ -n "${NVM_VERSION_ONLY-}" ]
	then
		command awk 'BEGIN {
      n = split(ARGV[1], a);
      print a[1]
    }' "${VERSION}"
	else
		nvm_echo "${VERSION}"
	fi
	if [ "${VERSION}" = 'N/A' ]
	then
		return 3
	fi
}
nvm_remote_versions () {
	local NVM_IOJS_PREFIX
	NVM_IOJS_PREFIX="$(nvm_iojs_prefix)" 
	local NVM_NODE_PREFIX
	NVM_NODE_PREFIX="$(nvm_node_prefix)" 
	local PATTERN
	PATTERN="${1-}" 
	local NVM_FLAVOR
	if [ -n "${NVM_LTS-}" ]
	then
		NVM_FLAVOR="${NVM_NODE_PREFIX}" 
	fi
	case "${PATTERN}" in
		("${NVM_IOJS_PREFIX}" | "io.js") NVM_FLAVOR="${NVM_IOJS_PREFIX}" 
			unset PATTERN ;;
		("${NVM_NODE_PREFIX}") NVM_FLAVOR="${NVM_NODE_PREFIX}" 
			unset PATTERN ;;
	esac
	if nvm_validate_implicit_alias "${PATTERN-}" 2> /dev/null
	then
		nvm_err 'Implicit aliases are not supported in nvm_remote_versions.'
		return 1
	fi
	local NVM_LS_REMOTE_EXIT_CODE
	NVM_LS_REMOTE_EXIT_CODE=0 
	local NVM_LS_REMOTE_PRE_MERGED_OUTPUT
	NVM_LS_REMOTE_PRE_MERGED_OUTPUT='' 
	local NVM_LS_REMOTE_POST_MERGED_OUTPUT
	NVM_LS_REMOTE_POST_MERGED_OUTPUT='' 
	if [ -z "${NVM_FLAVOR-}" ] || [ "${NVM_FLAVOR-}" = "${NVM_NODE_PREFIX}" ]
	then
		local NVM_LS_REMOTE_OUTPUT
		NVM_LS_REMOTE_OUTPUT="$(NVM_LTS="${NVM_LTS-}" nvm_ls_remote "${PATTERN-}") "  && :
		NVM_LS_REMOTE_EXIT_CODE=$? 
		NVM_LS_REMOTE_PRE_MERGED_OUTPUT="${NVM_LS_REMOTE_OUTPUT%%v4\.0\.0*}" 
		NVM_LS_REMOTE_POST_MERGED_OUTPUT="${NVM_LS_REMOTE_OUTPUT#"$NVM_LS_REMOTE_PRE_MERGED_OUTPUT"}" 
	fi
	local NVM_LS_REMOTE_IOJS_EXIT_CODE
	NVM_LS_REMOTE_IOJS_EXIT_CODE=0 
	local NVM_LS_REMOTE_IOJS_OUTPUT
	NVM_LS_REMOTE_IOJS_OUTPUT='' 
	if [ -z "${NVM_LTS-}" ] && {
			[ -z "${NVM_FLAVOR-}" ] || [ "${NVM_FLAVOR-}" = "${NVM_IOJS_PREFIX}" ]
		}
	then
		NVM_LS_REMOTE_IOJS_OUTPUT=$(nvm_ls_remote_iojs "${PATTERN-}")  && :
		NVM_LS_REMOTE_IOJS_EXIT_CODE=$? 
	fi
	VERSIONS="$(nvm_echo "${NVM_LS_REMOTE_PRE_MERGED_OUTPUT}
${NVM_LS_REMOTE_IOJS_OUTPUT}
${NVM_LS_REMOTE_POST_MERGED_OUTPUT}" | nvm_grep -v "N/A" | command sed '/^ *$/d')" 
	if [ -z "${VERSIONS}" ]
	then
		nvm_echo 'N/A'
		return 3
	fi
	nvm_echo "${VERSIONS}" | command sed 's/ *$//g'
	return $NVM_LS_REMOTE_EXIT_CODE || $NVM_LS_REMOTE_IOJS_EXIT_CODE
}
nvm_resolve_alias () {
	if [ -z "${1-}" ]
	then
		return 1
	fi
	local PATTERN
	PATTERN="${1-}" 
	local ALIAS
	ALIAS="${PATTERN}" 
	local ALIAS_TEMP
	local SEEN_ALIASES
	SEEN_ALIASES="${ALIAS}" 
	local NVM_ALIAS_INDEX
	NVM_ALIAS_INDEX=1 
	while true
	do
		ALIAS_TEMP="$( (nvm_alias "${ALIAS}" 2>/dev/null | command head -n "${NVM_ALIAS_INDEX}" | command tail -n 1) || nvm_echo)" 
		if [ -z "${ALIAS_TEMP}" ]
		then
			break
		fi
		if command printf "${SEEN_ALIASES}" | nvm_grep -q -e "^${ALIAS_TEMP}$"
		then
			ALIAS="∞" 
			break
		fi
		SEEN_ALIASES="${SEEN_ALIASES}\\n${ALIAS_TEMP}" 
		ALIAS="${ALIAS_TEMP}" 
	done
	if [ -n "${ALIAS}" ] && [ "_${ALIAS}" != "_${PATTERN}" ]
	then
		local NVM_IOJS_PREFIX
		NVM_IOJS_PREFIX="$(nvm_iojs_prefix)" 
		local NVM_NODE_PREFIX
		NVM_NODE_PREFIX="$(nvm_node_prefix)" 
		case "${ALIAS}" in
			('∞' | "${NVM_IOJS_PREFIX}" | "${NVM_IOJS_PREFIX}-" | "${NVM_NODE_PREFIX}") nvm_echo "${ALIAS}" ;;
			(*) nvm_ensure_version_prefix "${ALIAS}" ;;
		esac
		return 0
	fi
	if nvm_validate_implicit_alias "${PATTERN}" 2> /dev/null
	then
		local IMPLICIT
		IMPLICIT="$(nvm_print_implicit_alias local "${PATTERN}" 2>/dev/null)" 
		if [ -n "${IMPLICIT}" ]
		then
			nvm_ensure_version_prefix "${IMPLICIT}"
		fi
	fi
	return 2
}
nvm_resolve_local_alias () {
	if [ -z "${1-}" ]
	then
		return 1
	fi
	local VERSION
	local EXIT_CODE
	VERSION="$(nvm_resolve_alias "${1-}")" 
	EXIT_CODE=$? 
	if [ -z "${VERSION}" ]
	then
		return $EXIT_CODE
	fi
	if [ "_${VERSION}" != '_∞' ]
	then
		nvm_version "${VERSION}"
	else
		nvm_echo "${VERSION}"
	fi
}
nvm_sanitize_auth_header () {
	nvm_echo "$1" | command sed 's/[^a-zA-Z0-9:;_. -]//g'
}
nvm_sanitize_path () {
	local SANITIZED_PATH
	SANITIZED_PATH="${1-}" 
	if [ "_${SANITIZED_PATH}" != "_${NVM_DIR}" ]
	then
		SANITIZED_PATH="$(nvm_echo "${SANITIZED_PATH}" | command sed -e "s#${NVM_DIR}#\${NVM_DIR}#g")" 
	fi
	if [ "_${SANITIZED_PATH}" != "_${HOME}" ]
	then
		SANITIZED_PATH="$(nvm_echo "${SANITIZED_PATH}" | command sed -e "s#${HOME}#\${HOME}#g")" 
	fi
	nvm_echo "${SANITIZED_PATH}"
}
nvm_set_colors () {
	if [ "${#1}" -eq 5 ] && nvm_echo "$1" | nvm_grep -E "^[rRgGbBcCyYmMkKeW]{1,}$" > /dev/null
	then
		local INSTALLED_COLOR
		local LTS_AND_SYSTEM_COLOR
		local CURRENT_COLOR
		local NOT_INSTALLED_COLOR
		local DEFAULT_COLOR
		INSTALLED_COLOR="$(echo "$1" | awk '{ print substr($0, 1, 1); }')" 
		LTS_AND_SYSTEM_COLOR="$(echo "$1" | awk '{ print substr($0, 2, 1); }')" 
		CURRENT_COLOR="$(echo "$1" | awk '{ print substr($0, 3, 1); }')" 
		NOT_INSTALLED_COLOR="$(echo "$1" | awk '{ print substr($0, 4, 1); }')" 
		DEFAULT_COLOR="$(echo "$1" | awk '{ print substr($0, 5, 1); }')" 
		if ! nvm_has_colors
		then
			nvm_echo "Setting colors to: ${INSTALLED_COLOR} ${LTS_AND_SYSTEM_COLOR} ${CURRENT_COLOR} ${NOT_INSTALLED_COLOR} ${DEFAULT_COLOR}"
			nvm_echo "WARNING: Colors may not display because they are not supported in this shell."
		else
			nvm_echo_with_colors "Setting colors to: $(nvm_wrap_with_color_code "${INSTALLED_COLOR}" "${INSTALLED_COLOR}")$(nvm_wrap_with_color_code "${LTS_AND_SYSTEM_COLOR}" "${LTS_AND_SYSTEM_COLOR}")$(nvm_wrap_with_color_code "${CURRENT_COLOR}" "${CURRENT_COLOR}")$(nvm_wrap_with_color_code "${NOT_INSTALLED_COLOR}" "${NOT_INSTALLED_COLOR}")$(nvm_wrap_with_color_code "${DEFAULT_COLOR}" "${DEFAULT_COLOR}")"
		fi
		export NVM_COLORS="$1" 
	else
		return 17
	fi
}
nvm_stdout_is_terminal () {
	[ -t 1 ]
}
nvm_strip_iojs_prefix () {
	local NVM_IOJS_PREFIX
	NVM_IOJS_PREFIX="$(nvm_iojs_prefix)" 
	case "${1-}" in
		("${NVM_IOJS_PREFIX}") nvm_echo ;;
		(*) nvm_echo "${1#"${NVM_IOJS_PREFIX}"-}" ;;
	esac
}
nvm_strip_path () {
	if [ -z "${NVM_DIR-}" ]
	then
		nvm_err '${NVM_DIR} not set!'
		return 1
	fi
	local RESULT
	RESULT="$(command printf %s "${1-}" | command awk -v NVM_DIR="${NVM_DIR}" -v RS=: '
  index($0, NVM_DIR) == 1 {
    path = substr($0, length(NVM_DIR) + 1)
    if (path ~ "^(/versions/[^/]*)?/[^/]*'"${2-}"'.*$") { next }
  }
  { printf "%s%s", sep, $0; sep=RS }')" 
	case "${1-}" in
		(*:) command printf '%s:' "${RESULT}" ;;
		(*) command printf '%s' "${RESULT}" ;;
	esac
}
nvm_supports_xz () {
	if [ -z "${1-}" ]
	then
		return 1
	fi
	local NVM_OS
	NVM_OS="$(nvm_get_os)" 
	if [ "_${NVM_OS}" = '_darwin' ]
	then
		local MACOS_VERSION
		MACOS_VERSION="$(sw_vers -productVersion)" 
		if nvm_version_greater "10.9.0" "${MACOS_VERSION}"
		then
			return 1
		fi
	elif [ "_${NVM_OS}" = '_freebsd' ]
	then
		if ! [ -e '/usr/lib/liblzma.so' ]
		then
			return 1
		fi
	else
		if ! command which xz > /dev/null 2>&1
		then
			return 1
		fi
	fi
	if nvm_is_merged_node_version "${1}"
	then
		return 0
	fi
	if nvm_version_greater_than_or_equal_to "${1}" "0.12.10" && nvm_version_greater "0.13.0" "${1}"
	then
		return 0
	fi
	if nvm_version_greater_than_or_equal_to "${1}" "0.10.42" && nvm_version_greater "0.11.0" "${1}"
	then
		return 0
	fi
	case "${NVM_OS}" in
		(darwin) nvm_version_greater_than_or_equal_to "${1}" "2.3.2" ;;
		(*) nvm_version_greater_than_or_equal_to "${1}" "1.0.0" ;;
	esac
	return $?
}
nvm_tree_contains_path () {
	local tree
	tree="${1-}" 
	local node_path
	node_path="${2-}" 
	if [ "@${tree}@" = "@@" ] || [ "@${node_path}@" = "@@" ]
	then
		nvm_err "both the tree and the node path are required"
		return 2
	fi
	local previous_pathdir
	previous_pathdir="${node_path}" 
	local pathdir
	pathdir=$(dirname "${previous_pathdir}") 
	while [ "${pathdir}" != '' ] && [ "${pathdir}" != '.' ] && [ "${pathdir}" != '/' ] && [ "${pathdir}" != "${tree}" ] && [ "${pathdir}" != "${previous_pathdir}" ]
	do
		previous_pathdir="${pathdir}" 
		pathdir=$(dirname "${previous_pathdir}") 
	done
	[ "${pathdir}" = "${tree}" ]
}
nvm_use_if_needed () {
	if [ "_${1-}" = "_$(nvm_ls_current)" ]
	then
		return
	fi
	nvm use "$@"
}
nvm_validate_implicit_alias () {
	local NVM_IOJS_PREFIX
	NVM_IOJS_PREFIX="$(nvm_iojs_prefix)" 
	local NVM_NODE_PREFIX
	NVM_NODE_PREFIX="$(nvm_node_prefix)" 
	case "$1" in
		("stable" | "unstable" | "${NVM_IOJS_PREFIX}" | "${NVM_NODE_PREFIX}") return ;;
		(*) nvm_err "Only implicit aliases 'stable', 'unstable', '${NVM_IOJS_PREFIX}', and '${NVM_NODE_PREFIX}' are supported."
			return 1 ;;
	esac
}
nvm_version () {
	local PATTERN
	PATTERN="${1-}" 
	local VERSION
	if [ -z "${PATTERN}" ]
	then
		PATTERN='current' 
	fi
	if [ "${PATTERN}" = "current" ]
	then
		nvm_ls_current
		return $?
	fi
	local NVM_NODE_PREFIX
	NVM_NODE_PREFIX="$(nvm_node_prefix)" 
	case "_${PATTERN}" in
		("_${NVM_NODE_PREFIX}" | "_${NVM_NODE_PREFIX}-") PATTERN="stable"  ;;
	esac
	VERSION="$(nvm_ls "${PATTERN}" | command tail -1)" 
	case "${VERSION}" in
		(system[[:blank:]]*) VERSION='system'  ;;
	esac
	if [ -z "${VERSION}" ] || [ "_${VERSION}" = "_N/A" ]
	then
		nvm_echo "N/A"
		return 3
	fi
	nvm_echo "${VERSION}"
}
nvm_version_dir () {
	local NVM_WHICH_DIR
	NVM_WHICH_DIR="${1-}" 
	if [ -z "${NVM_WHICH_DIR}" ] || [ "${NVM_WHICH_DIR}" = "new" ]
	then
		nvm_echo "${NVM_DIR}/versions/node"
	elif [ "_${NVM_WHICH_DIR}" = "_iojs" ]
	then
		nvm_echo "${NVM_DIR}/versions/io.js"
	elif [ "_${NVM_WHICH_DIR}" = "_old" ]
	then
		nvm_echo "${NVM_DIR}"
	else
		nvm_err 'unknown version dir'
		return 3
	fi
}
nvm_version_greater () {
	command awk 'BEGIN {
    if (ARGV[1] == "" || ARGV[2] == "") exit(1)
    split(ARGV[1], a, /\./);
    split(ARGV[2], b, /\./);
    for (i=1; i<=3; i++) {
      if (a[i] && a[i] !~ /^[0-9]+$/) exit(2);
      if (b[i] && b[i] !~ /^[0-9]+$/) { exit(0); }
      if (a[i] < b[i]) exit(3);
      else if (a[i] > b[i]) exit(0);
    }
    exit(4)
  }' "${1#v}" "${2#v}"
}
nvm_version_greater_than_or_equal_to () {
	command awk 'BEGIN {
    if (ARGV[1] == "" || ARGV[2] == "") exit(1)
    split(ARGV[1], a, /\./);
    split(ARGV[2], b, /\./);
    for (i=1; i<=3; i++) {
      if (a[i] && a[i] !~ /^[0-9]+$/) exit(2);
      if (a[i] < b[i]) exit(3);
      else if (a[i] > b[i]) exit(0);
    }
    exit(0)
  }' "${1#v}" "${2#v}"
}
nvm_version_path () {
	local VERSION
	VERSION="${1-}" 
	if [ -z "${VERSION}" ]
	then
		nvm_err 'version is required'
		return 3
	elif nvm_is_iojs_version "${VERSION}"
	then
		nvm_echo "$(nvm_version_dir iojs)/$(nvm_strip_iojs_prefix "${VERSION}")"
	elif nvm_version_greater 0.12.0 "${VERSION}"
	then
		nvm_echo "$(nvm_version_dir old)/${VERSION}"
	else
		nvm_echo "$(nvm_version_dir new)/${VERSION}"
	fi
}
nvm_wrap_with_color_code () {
	local CODE
	CODE="$(nvm_print_color_code "${1}" 2>/dev/null ||:)" 
	local TEXT
	TEXT="${2-}" 
	if nvm_has_colors && [ -n "${CODE}" ]
	then
		nvm_echo_with_colors "\033[${CODE}${TEXT}\033[0m"
	else
		nvm_echo "${TEXT}"
	fi
}
nvm_write_nvmrc () {
	local VERSION_STRING
	VERSION_STRING=$(nvm_version "${1-}") 
	if [ "${VERSION_STRING}" = '∞' ] || [ "${VERSION_STRING}" = 'N/A' ]
	then
		return 1
	fi
	echo "${VERSION_STRING}" | tee "$PWD"/.nvmrc > /dev/null || {
		if [ "${NVM_SILENT:-0}" -ne 1 ]
		then
			nvm_err "Warning: Unable to write version number ($VERSION_STRING) to .nvmrc"
		fi
		return 3
	}
	if [ "${NVM_SILENT:-0}" -ne 1 ]
	then
		nvm_echo "Wrote version number ($VERSION_STRING) to .nvmrc"
	fi
}
omz_urldecode () {
	emulate -L zsh
	local encoded_url=$1 
	local caller_encoding=$langinfo[CODESET] 
	local LC_ALL=C 
	export LC_ALL
	local tmp=${encoded_url:gs/+/ /} 
	tmp=${tmp:gs/\\/\\\\/} 
	tmp=${tmp:gs/%/\\x/} 
	local decoded="$(printf -- "$tmp")" 
	local -a safe_encodings
	safe_encodings=(UTF-8 utf8 US-ASCII) 
	if [[ -z ${safe_encodings[(r)$caller_encoding]} ]]
	then
		decoded=$(echo -E "$decoded" | iconv -f UTF-8 -t $caller_encoding) 
		if [[ $? != 0 ]]
		then
			echo "Error converting string from UTF-8 to $caller_encoding" >&2
			return 1
		fi
	fi
	echo -E "$decoded"
}
omz_urlencode () {
	emulate -L zsh
	setopt norematchpcre
	local -a opts
	zparseopts -D -E -a opts r m P
	local in_str="$@" 
	local url_str="" 
	local spaces_as_plus
	if [[ -z $opts[(r)-P] ]]
	then
		spaces_as_plus=1 
	fi
	local str="$in_str" 
	local encoding=$langinfo[CODESET] 
	local safe_encodings
	safe_encodings=(UTF-8 utf8 US-ASCII) 
	if [[ -z ${safe_encodings[(r)$encoding]} ]]
	then
		str=$(echo -E "$str" | iconv -f $encoding -t UTF-8) 
		if [[ $? != 0 ]]
		then
			echo "Error converting string from $encoding to UTF-8" >&2
			return 1
		fi
	fi
	local i byte ord LC_ALL=C 
	export LC_ALL
	local reserved=';/?:@&=+$,' 
	local mark='_.!~*''()-' 
	local dont_escape="[A-Za-z0-9" 
	if [[ -z $opts[(r)-r] ]]
	then
		dont_escape+=$reserved 
	fi
	if [[ -z $opts[(r)-m] ]]
	then
		dont_escape+=$mark 
	fi
	dont_escape+="]" 
	local url_str="" 
	for ((i = 1; i <= ${#str}; ++i )) do
		byte="$str[i]" 
		if [[ "$byte" =~ "$dont_escape" ]]
		then
			url_str+="$byte" 
		else
			if [[ "$byte" == " " && -n $spaces_as_plus ]]
			then
				url_str+="+" 
			elif [[ "$PREFIX" = *com.termux* ]]
			then
				url_str+="$byte" 
			else
				ord=$(( [##16] #byte )) 
				url_str+="%$ord" 
			fi
		fi
	done
	echo -E "$url_str"
}
open_command () {
	local open_cmd
	case "$OSTYPE" in
		(darwin*) open_cmd='open'  ;;
		(cygwin*) open_cmd='cygstart'  ;;
		(linux*) [[ "$(uname -r)" != *icrosoft* ]] && open_cmd='nohup xdg-open'  || {
				open_cmd='cmd.exe /c start ""' 
				[[ -e "$1" ]] && {
					1="$(wslpath -w "${1:a}")"  || return 1
				}
				[[ "$1" = (http|https)://* ]] && {
					1="$(echo "$1" | sed -E 's/([&|()<>^])/^\1/g')"  || return 1
				}
			} ;;
		(msys*) open_cmd='start ""'  ;;
		(*) echo "Platform $OSTYPE not supported"
			return 1 ;;
	esac
	if [[ -n "$BROWSER" && "$1" = (http|https)://* ]]
	then
		"$BROWSER" "$@"
		return
	fi
	${=open_cmd} "$@" &> /dev/null
}
opencode () {
	AGENT=1 command opencode "$@"
}
parse_git_dirty () {
	local STATUS
	local -a FLAGS
	FLAGS=('--porcelain') 
	if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-dirty)" != "1" ]]
	then
		if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]
		then
			FLAGS+='--untracked-files=no' 
		fi
		case "${GIT_STATUS_IGNORE_SUBMODULES:-}" in
			(git)  ;;
			(*) FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"  ;;
		esac
		STATUS=$(__git_prompt_git status ${FLAGS} 2> /dev/null | tail -n 1) 
	fi
	if [[ -n $STATUS ]]
	then
		echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
	else
		echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
	fi
}
port () {
	[[ -z "$1" ]] && {
		echo "Usage: port <number>"
		return 1
	}
	lsof -i :"$1"
}
pyenv_prompt_info () {
	if [[ "$ZSH_THEME_PYENV_NO_SYSTEM" == "true" ]]
	then
		return
	fi
	local version="$(python3 -V 2>&1 | cut -d' ' -f2)" 
	echo "${ZSH_THEME_PYENV_PREFIX=}system: ${version:gs/%/%%}${ZSH_THEME_PYENV_SUFFIX=}"
}
regexp-replace () {
	argv=("$1" "$2" "$3") 
	4=0 
	[[ -o re_match_pcre ]] && 4=1 
	emulate -L zsh
	local MATCH MBEGIN MEND
	local -a match mbegin mend
	if (( $4 ))
	then
		zmodload zsh/pcre || return 2
		pcre_compile -- "$2" && pcre_study || return 2
		4=0 6= 
		local ZPCRE_OP
		while pcre_match -b -n $4 -- "${(P)1}"
		do
			5=${(e)3} 
			argv+=(${(s: :)ZPCRE_OP} "$5") 
			4=$((argv[-2] + (argv[-3] == argv[-2]))) 
		done
		(($# > 6)) || return
		set +o multibyte
		5= 6=1 
		for 2 3 4 in "$@[7,-1]"
		do
			5+=${(P)1[$6,$2]}$4 
			6=$(($3 + 1)) 
		done
		5+=${(P)1[$6,-1]} 
	else
		4=${(P)1} 
		while [[ -n $4 ]]
		do
			if [[ $4 =~ $2 ]]
			then
				5+=${4[1,MBEGIN-1]}${(e)3} 
				if ((MEND < MBEGIN))
				then
					((MEND++))
					5+=${4[1]} 
				fi
				4=${4[MEND+1,-1]} 
				6=1 
			else
				break
			fi
		done
		[[ -n $6 ]] || return
		5+=$4 
	fi
	eval $1=\$5
}
sudo-command-line () {
	[[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)" 
	local WHITESPACE="" 
	if [[ ${LBUFFER:0:1} = " " ]]
	then
		WHITESPACE=" " 
		LBUFFER="${LBUFFER:1}" 
	fi
	{
		local EDITOR=${SUDO_EDITOR:-${VISUAL:-$EDITOR}} 
		if [[ -z "$EDITOR" ]]
		then
			case "$BUFFER" in
				(sudo\ -e\ *) __sudo-replace-buffer "sudo -e" "" ;;
				(sudo\ *) __sudo-replace-buffer "sudo" "" ;;
				(*) LBUFFER="sudo $LBUFFER"  ;;
			esac
			return
		fi
		local cmd="${${(Az)BUFFER}[1]}" 
		local realcmd="${${(Az)aliases[$cmd]}[1]:-$cmd}" 
		local editorcmd="${${(Az)EDITOR}[1]}" 
		if [[ "$realcmd" = (\$EDITOR|$editorcmd|${editorcmd:c}) || "${realcmd:c}" = ($editorcmd|${editorcmd:c}) ]] || builtin which -a "$realcmd" | command grep -Fx -q "$editorcmd"
		then
			__sudo-replace-buffer "$cmd" "sudo -e"
			return
		fi
		case "$BUFFER" in
			($editorcmd\ *) __sudo-replace-buffer "$editorcmd" "sudo -e" ;;
			(\$EDITOR\ *) __sudo-replace-buffer '$EDITOR' "sudo -e" ;;
			(sudo\ -e\ *) __sudo-replace-buffer "sudo -e" "$EDITOR" ;;
			(sudo\ *) __sudo-replace-buffer "sudo" "" ;;
			(*) LBUFFER="sudo $LBUFFER"  ;;
		esac
	} always {
		LBUFFER="${WHITESPACE}${LBUFFER}" 
		zle && zle redisplay
	}
}
take () {
	if [[ $1 =~ ^(https?|ftp).*\.(tar\.(gz|bz2|xz)|tgz)$ ]]
	then
		takeurl "$1"
	elif [[ $1 =~ ^(https?|ftp).*\.(zip)$ ]]
	then
		takezip "$1"
	elif [[ $1 =~ ^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?$ ]]
	then
		takegit "$1"
	else
		takedir "$@"
	fi
}
takedir () {
	mkdir -p $@ && cd ${@:$#}
}
takegit () {
	git clone "$1"
	cd "$(basename ${1%%.git})"
}
takeurl () {
	local data thedir
	data="$(mktemp)" 
	curl -L "$1" > "$data"
	tar xf "$data"
	thedir="$(tar tf "$data" | head -n 1)" 
	rm "$data"
	cd "$thedir"
}
takezip () {
	local data thedir
	data="$(mktemp)" 
	curl -L "$1" > "$data"
	unzip "$data" -d "./"
	thedir="$(unzip -l "$data" | awk 'NR==4 {print $4}' | sed 's/\/.*//')" 
	rm "$data"
	cd "$thedir"
}
try_alias_value () {
	alias_value "$1" || echo "$1"
}
uninstall_oh_my_zsh () {
	command env ZSH="$ZSH" sh "$ZSH/tools/uninstall.sh"
}
upgrade_oh_my_zsh () {
	echo "${fg[yellow]}Note: \`$0\` is deprecated. Use \`omz update\` instead.$reset_color" >&2
	omz update
}
use_standard-python () {
	source_up_if_exists
	dotenv_if_exists
	source_env_if_exists .envrc.local
	use venv
	uv sync
}
use_venv () {
	uv venv
	source .venv/bin/activate
}
vi_mode_prompt_info () {
	echo "${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/$INSERT_MODE_INDICATOR}"
}
virtualenv_prompt_info () {
	[[ -n ${VIRTUAL_ENV} ]] || return
	echo "${ZSH_THEME_VIRTUALENV_PREFIX=[}${VIRTUAL_ENV_PROMPT:-${VIRTUAL_ENV:t:gs/%/%%}}${ZSH_THEME_VIRTUALENV_SUFFIX=]}"
}
work_in_progress () {
	command git -c log.showSignature=false log -n 1 2> /dev/null | grep -q -- "--wip--" && echo "WIP!!"
}
wt () {
	local use_source=false 
	local -a args
	for arg in "$@"
	do
		if [[ "$arg" == "--source" ]]
		then
			use_source=true 
		else
			args+=("$arg") 
		fi
	done
	if [[ -n "${COMPLETE:-}" ]]
	then
		command "${WORKTRUNK_BIN:-wt}" "${args[@]}"
		return
	fi
	local directive_file exit_code=0 
	directive_file="$(mktemp)" 
	if [[ "$use_source" == true ]]
	then
		WORKTRUNK_DIRECTIVE_FILE="$directive_file" cargo run --bin wt --quiet -- "${args[@]}" || exit_code=$? 
	else
		WORKTRUNK_DIRECTIVE_FILE="$directive_file" command "${WORKTRUNK_BIN:-wt}" "${args[@]}" || exit_code=$? 
	fi
	if [[ -s "$directive_file" ]]
	then
		source "$directive_file"
		if [[ $exit_code -eq 0 ]]
		then
			exit_code=$? 
		fi
	fi
	rm -f "$directive_file"
	return "$exit_code"
}
yt () {
	local video_link="$1" 
	fabric -y "$video_link" --transcript --dry-run
}
z () {
	__zoxide_z "$@"
}
ze () {
	zellij edit "$*"
}
zef () {
	zellij edit --floating "$*"
}
zei () {
	zellij edit --in-place "$*"
}
zi () {
	__zoxide_zi "$@"
}
zle-keymap-select () {
	typeset -g VI_KEYMAP=$KEYMAP 
	if _vi-mode-should-reset-prompt
	then
		zle reset-prompt
		zle -R
	fi
	_vi-mode-set-cursor-shape-for-keymap "${VI_KEYMAP}"
}
zle-line-finish () {
	typeset -g VI_KEYMAP=main 
	(( ! ${+terminfo[rmkx]} )) || echoti rmkx
	_vi-mode-set-cursor-shape-for-keymap default
}
zle-line-init () {
	local prev_vi_keymap="${VI_KEYMAP:-}" 
	typeset -g VI_KEYMAP=main 
	[[ "$prev_vi_keymap" != 'main' ]] && _vi-mode-should-reset-prompt && zle reset-prompt
	(( ! ${+terminfo[smkx]} )) || echoti smkx
	_vi-mode-set-cursor-shape-for-keymap "${VI_KEYMAP}"
}
znt-cd-widget () {
	# undefined
	builtin autoload -X
}
znt-history-widget () {
	# undefined
	builtin autoload -X
}
znt-kill-widget () {
	# undefined
	builtin autoload -X
}
znt-usetty-wrapper () {
	# undefined
	builtin autoload -X
}
zpipe () {
	if [ -z "$1" ]
	then
		zellij pipe
	else
		zellij pipe -p $1
	fi
}
zplug () {
	local arg="$1" 
	case "$arg" in
		(-* | --*) __zplug::core::options::parse "$argv[@]" ;;
		(check | install | update | list | clean | status | clear | load | info | help) shift
			__zplug::core::core::run_interfaces "$arg" "$argv[@]" ;;
		(*/*) __zplug::core::add::to_zplugs "$argv[@]" ;;
		("") __zplug::core::arguments::none ;;
		(*) __zplug::core::arguments::exec "$argv[@]" ;;
	esac
	return $status
}
zr () {
	zellij run --name "$*" -- zsh -ic "$*"
}
zrf () {
	zellij run --name "$*" --floating -- zsh -ic "$*"
}
zri () {
	zellij run --name "$*" --in-place -- zsh -ic "$*"
}
zsh-z_plugin_unload () {
	emulate -L zsh
	add-zsh-hook -D precmd _zshz_precmd
	add-zsh-hook -d chpwd _zshz_chpwd
	local x
	for x in ${=ZSHZ[FUNCTIONS]}
	do
		(( ${+functions[$x]} )) && unfunction $x
	done
	unset ZSHZ
	fpath=("${(@)fpath:#${0:A:h}}") 
	(( ${+aliases[${ZSHZ_CMD:-${_Z_CMD:-z}}]} )) && unalias ${ZSHZ_CMD:-${_Z_CMD:-z}}
	unfunction $0
}
zsh_stats () {
	fc -l 1 | awk '{ CMD[$2]++; count++; } END { for (a in CMD) print CMD[a] " " CMD[a]*100/count "% " a }' | grep -v "./" | sort -nr | head -n 20 | column -c3 -s " " -t | nl
}
zshz () {
	setopt LOCAL_OPTIONS NO_KSH_ARRAYS NO_SH_WORD_SPLIT EXTENDED_GLOB UNSET
	(( ZSHZ_DEBUG )) && setopt LOCAL_OPTIONS WARN_CREATE_GLOBAL
	local REPLY
	local -a lines
	local custom_datafile="${ZSHZ_DATA:-$_Z_DATA}" 
	if [[ -n ${custom_datafile} && ${custom_datafile} != */* ]]
	then
		print "ERROR: You configured a custom Zsh-z datafile (${custom_datafile}), but have not specified its directory." >&2
		exit
	fi
	local datafile=${${custom_datafile:-$HOME/.z}:A} 
	if [[ -d $datafile ]]
	then
		print "ERROR: Zsh-z's datafile (${datafile}) is a directory." >&2
		exit
	fi
	[[ -f $datafile ]] || {
		mkdir -p "${datafile:h}" && touch "$datafile"
	}
	[[ -z ${ZSHZ_OWNER:-${_Z_OWNER}} && -f $datafile && ! -O $datafile ]] && return
	lines=(${(f)"$(< $datafile)"}) 
	lines=(${(M)lines:#/*\|[[:digit:]]##[.,]#[[:digit:]]#\|[[:digit:]]##}) 
	_zshz_add_or_remove_path () {
		local action=${1} 
		shift
		if [[ $action == '--add' ]]
		then
			[[ $* == $HOME ]] && return
			local exclude
			for exclude in ${(@)ZSHZ_EXCLUDE_DIRS:-${(@)_Z_EXCLUDE_DIRS}}
			do
				case $* in
					(${exclude} | ${exclude}/*) return ;;
				esac
			done
		fi
		local tempfile="${datafile}.${RANDOM}" 
		if (( ZSHZ[USE_FLOCK] ))
		then
			local lockfd
			zsystem flock -f lockfd "$datafile" 2> /dev/null || return
		fi
		integer tmpfd
		case $action in
			(--add) exec {tmpfd}>| "$tempfile"
				_zshz_update_datafile $tmpfd "$*"
				local ret=$?  ;;
			(--remove) local xdir
				if (( ${ZSHZ_NO_RESOLVE_SYMLINKS:-${_Z_NO_RESOLVE_SYMLINKS}} ))
				then
					[[ -d ${${*:-${PWD}}:a} ]] && xdir=${${*:-${PWD}}:a} 
				else
					[[ -d ${${*:-${PWD}}:A} ]] && xdir=${${*:-${PWD}}:a} 
				fi
				local -a lines_to_keep
				if (( ${+opts[-R]} ))
				then
					if [[ $xdir == '/' ]] && ! read -q "?Delete entire Zsh-z database? "
					then
						print && return 1
					fi
					lines_to_keep=(${lines:#${xdir}\|*}) 
					lines_to_keep=(${lines_to_keep:#${xdir%/}/**}) 
				else
					lines_to_keep=(${lines:#${xdir}\|*}) 
				fi
				if [[ $lines != "$lines_to_keep" ]]
				then
					lines=($lines_to_keep) 
				else
					return 1
				fi
				exec {tmpfd}>| "$tempfile"
				print -u $tmpfd -l -- $lines
				local ret=$?  ;;
		esac
		if (( tmpfd != 0 ))
		then
			exec {tmpfd}>&-
		fi
		if (( ret != 0 ))
		then
			${ZSHZ[RM]} -f "$tempfile"
			return $ret
		fi
		local owner
		owner=${ZSHZ_OWNER:-${_Z_OWNER}} 
		if (( ZSHZ[USE_FLOCK] ))
		then
			if [[ -r '/proc/1/cgroup' && "$(< '/proc/1/cgroup')" == *docker* ]]
			then
				print "$(< "$tempfile")" > "$datafile" 2> /dev/null
				${ZSHZ[RM]} -f "$tempfile"
			else
				${ZSHZ[MV]} "$tempfile" "$datafile" 2> /dev/null || ${ZSHZ[RM]} -f "$tempfile"
			fi
			if [[ -n $owner ]]
			then
				${ZSHZ[CHOWN]} ${owner}:"$(id -ng ${owner})" "$datafile"
			fi
		else
			if [[ -n $owner ]]
			then
				${ZSHZ[CHOWN]} "${owner}":"$(id -ng "${owner}")" "$tempfile"
			fi
			${ZSHZ[MV]} -f "$tempfile" "$datafile" 2> /dev/null || ${ZSHZ[RM]} -f "$tempfile"
		fi
		if [[ $action == '--remove' ]]
		then
			ZSHZ[DIRECTORY_REMOVED]=1 
		fi
	}
	_zshz_update_datafile () {
		integer fd=$1 
		local -A rank time
		local add_path=${(q)2} 
		local -a existing_paths
		local now=$EPOCHSECONDS line dir 
		local path_field rank_field time_field count x
		rank[$add_path]=1 
		time[$add_path]=$now 
		for line in $lines
		do
			if [[ ! -d ${line%%\|*} ]]
			then
				for dir in ${(@)ZSHZ_KEEP_DIRS}
				do
					if [[ ${line%%\|*} == ${dir}/* || ${line%%\|*} == $dir || $dir == '/' ]]
					then
						existing_paths+=($line) 
					fi
				done
			else
				existing_paths+=($line) 
			fi
		done
		lines=($existing_paths) 
		for line in $lines
		do
			path_field=${(q)line%%\|*} 
			rank_field=${${line%\|*}#*\|} 
			time_field=${line##*\|} 
			(( rank_field < 1 )) && continue
			if [[ $path_field == $add_path ]]
			then
				rank[$path_field]=$rank_field 
				(( rank[$path_field]++ ))
				time[$path_field]=$now 
			else
				rank[$path_field]=$rank_field 
				time[$path_field]=$time_field 
			fi
			(( count += rank_field ))
		done
		if (( count > ${ZSHZ_MAX_SCORE:-${_Z_MAX_SCORE:-9000}} ))
		then
			for x in ${(k)rank}
			do
				print -u $fd -- "$x|$(( 0.99 * rank[$x] ))|${time[$x]}" || return 1
			done
		else
			for x in ${(k)rank}
			do
				print -u $fd -- "$x|${rank[$x]}|${time[$x]}" || return 1
			done
		fi
	}
	_zshz_legacy_complete () {
		local line path_field path_field_normalized
		1=${1//[[:space:]]/*} 
		for line in $lines
		do
			path_field=${line%%\|*} 
			path_field_normalized=$path_field 
			if (( ZSHZ_TRAILING_SLASH ))
			then
				path_field_normalized=${path_field%/}/ 
			fi
			if [[ $1 == "${1:l}" && ${path_field_normalized:l} == *${~1}* ]]
			then
				print -- $path_field
			elif [[ $path_field_normalized == *${~1}* ]]
			then
				print -- $path_field
			fi
		done
	}
	_zshz_printv () {
		if (( ZSHZ[PRINTV] ))
		then
			builtin print -v REPLY -f %s $@
		else
			builtin print -z $@
			builtin read -rz REPLY
		fi
	}
	_zshz_find_common_root () {
		local -a common_matches
		local x short
		common_matches=(${(@Pk)1}) 
		for x in ${(@)common_matches}
		do
			if [[ -z $short ]] || (( $#x < $#short )) || [[ $x != ${short}/* ]]
			then
				short=$x 
			fi
		done
		[[ $short == '/' ]] && return
		for x in ${(@)common_matches}
		do
			[[ $x != $short* ]] && return
		done
		_zshz_printv -- $short
	}
	_zshz_output () {
		local match_array=$1 match=$2 format=$3 
		local common k x
		local -a descending_list output
		local -A output_matches
		output_matches=(${(Pkv)match_array}) 
		_zshz_find_common_root $match_array
		common=$REPLY 
		case $format in
			(completion) for k in ${(@k)output_matches}
				do
					_zshz_printv -f "%.2f|%s" ${output_matches[$k]} $k
					descending_list+=(${(f)REPLY}) 
					REPLY='' 
				done
				descending_list=(${${(@On)descending_list}#*\|}) 
				print -l $descending_list ;;
			(list) local path_to_display
				for x in ${(k)output_matches}
				do
					if (( ${output_matches[$x]} ))
					then
						path_to_display=$x 
						(( ZSHZ_TILDE )) && path_to_display=${path_to_display/#${HOME}/\~} 
						_zshz_printv -f "%-10d %s\n" ${output_matches[$x]} $path_to_display
						output+=(${(f)REPLY}) 
						REPLY='' 
					fi
				done
				if [[ -n $common ]]
				then
					(( ZSHZ_TILDE )) && common=${common/#${HOME}/\~} 
					(( $#output > 1 )) && printf "%-10s %s\n" 'common:' $common
				fi
				if (( $+opts[-t] ))
				then
					for x in ${(@On)output}
					do
						print -- $x
					done
				elif (( $+opts[-r] ))
				then
					for x in ${(@on)output}
					do
						print -- $x
					done
				else
					for x in ${(@on)output}
					do
						print $x
					done
				fi ;;
			(*) if (( ! ZSHZ_UNCOMMON )) && [[ -n $common ]]
				then
					_zshz_printv -- $common
				else
					_zshz_printv -- ${(P)match}
				fi ;;
		esac
	}
	_zshz_find_matches () {
		setopt LOCAL_OPTIONS NO_EXTENDED_GLOB
		local fnd=$1 method=$2 format=$3 
		local -a existing_paths
		local line dir path_field rank_field time_field rank dx escaped_path_field
		local -A matches imatches
		local best_match ibest_match hi_rank=-9999999999 ihi_rank=-9999999999 
		for line in $lines
		do
			if [[ ! -d ${line%%\|*} ]]
			then
				for dir in ${(@)ZSHZ_KEEP_DIRS}
				do
					if [[ ${line%%\|*} == ${dir}/* || ${line%%\|*} == $dir || $dir == '/' ]]
					then
						existing_paths+=($line) 
					fi
				done
			else
				existing_paths+=($line) 
			fi
		done
		lines=($existing_paths) 
		for line in $lines
		do
			path_field=${line%%\|*} 
			rank_field=${${line%\|*}#*\|} 
			time_field=${line##*\|} 
			case $method in
				(rank) rank=$rank_field  ;;
				(time) (( rank = time_field - EPOCHSECONDS )) ;;
				(*) (( dx = EPOCHSECONDS - time_field ))
					rank=$(( 10000 * rank_field * (3.75/( (0.0001 * dx + 1) + 0.25)) ))  ;;
			esac
			local q=${fnd//[[:space:]]/\*} 
			local path_field_normalized=$path_field 
			if (( ZSHZ_TRAILING_SLASH ))
			then
				path_field_normalized=${path_field%/}/ 
			fi
			if [[ $ZSHZ_CASE == 'smart' && ${1:l} == $1 && ${path_field_normalized:l} == ${~q:l} ]]
			then
				imatches[$path_field]=$rank 
			elif [[ $ZSHZ_CASE != 'ignore' && $path_field_normalized == ${~q} ]]
			then
				matches[$path_field]=$rank 
			elif [[ $ZSHZ_CASE != 'smart' && ${path_field_normalized:l} == ${~q:l} ]]
			then
				imatches[$path_field]=$rank 
			fi
			escaped_path_field=${path_field//'\'/'\\'} 
			escaped_path_field=${escaped_path_field//'`'/'\`'} 
			escaped_path_field=${escaped_path_field//'('/'\('} 
			escaped_path_field=${escaped_path_field//')'/'\)'} 
			escaped_path_field=${escaped_path_field//'['/'\['} 
			escaped_path_field=${escaped_path_field//']'/'\]'} 
			if (( matches[$escaped_path_field] )) && (( matches[$escaped_path_field] > hi_rank ))
			then
				best_match=$path_field 
				hi_rank=${matches[$escaped_path_field]} 
			elif (( imatches[$escaped_path_field] )) && (( imatches[$escaped_path_field] > ihi_rank ))
			then
				ibest_match=$path_field 
				ihi_rank=${imatches[$escaped_path_field]} 
				ZSHZ[CASE_INSENSITIVE]=1 
			fi
		done
		[[ -z $best_match && -z $ibest_match ]] && return 1
		if [[ -n $best_match ]]
		then
			_zshz_output matches best_match $format
		elif [[ -n $ibest_match ]]
		then
			_zshz_output imatches ibest_match $format
		fi
	}
	local -A opts
	zparseopts -E -D -A opts -- -add -complete c e h -help l r R t x
	if [[ $1 == '--' ]]
	then
		shift
	elif [[ -n ${(M)@:#-*} && -z $compstate ]]
	then
		print "Improper option(s) given."
		_zshz_usage
		return 1
	fi
	local opt output_format method='frecency' fnd prefix req 
	for opt in ${(k)opts}
	do
		case $opt in
			(--add) [[ ! -d $* ]] && return 1
				local dir
				if [[ $OSTYPE == (cygwin|msys) && $PWD == '/' && $* != /* ]]
				then
					set -- "/$*"
				fi
				if (( ${ZSHZ_NO_RESOLVE_SYMLINKS:-${_Z_NO_RESOLVE_SYMLINKS}} ))
				then
					dir=${*:a} 
				else
					dir=${*:A} 
				fi
				_zshz_add_or_remove_path --add "$dir"
				return ;;
			(--complete) if [[ -s $datafile && ${ZSHZ_COMPLETION:-frecent} == 'legacy' ]]
				then
					_zshz_legacy_complete "$1"
					return
				fi
				output_format='completion'  ;;
			(-c) [[ $* == ${PWD}/* || $PWD == '/' ]] || prefix="$PWD "  ;;
			(-h | --help) _zshz_usage
				return ;;
			(-l) output_format='list'  ;;
			(-r) method='rank'  ;;
			(-t) method='time'  ;;
			(-x) if [[ $OSTYPE == (cygwin|msys) && $PWD == '/' && $* != /* ]]
				then
					set -- "/$*"
				fi
				_zshz_add_or_remove_path --remove $*
				return ;;
		esac
	done
	req="$*" 
	fnd="$prefix$*" 
	[[ -n $fnd && $fnd != "$PWD " ]] || {
		[[ $output_format != 'completion' ]] && output_format='list' 
	}
	zshz_cd () {
		setopt LOCAL_OPTIONS NO_WARN_CREATE_GLOBAL
		if [[ -z $ZSHZ_CD ]]
		then
			builtin cd "$*"
		else
			${=ZSHZ_CD} "$*"
		fi
	}
	_zshz_echo () {
		if (( ZSHZ_ECHO ))
		then
			if (( ZSHZ_TILDE ))
			then
				print ${PWD/#${HOME}/\~}
			else
				print $PWD
			fi
		fi
	}
	if [[ ${@: -1} == /* ]] && (( ! $+opts[-e] && ! $+opts[-l] ))
	then
		[[ -d ${@: -1} ]] && zshz_cd ${@: -1} && _zshz_echo && return
	fi
	if [[ ! -z ${(tP)opts[-c]} ]]
	then
		_zshz_find_matches "$fnd*" $method $output_format
	else
		_zshz_find_matches "*$fnd*" $method $output_format
	fi
	local ret2=$? 
	local cd
	cd=$REPLY 
	if (( ZSHZ_UNCOMMON )) && [[ -n $cd ]]
	then
		if [[ -n $cd ]]
		then
			local q=${fnd//[[:space:]]/\*} 
			q=${q%/} 
			if (( ! ZSHZ[CASE_INSENSITIVE] ))
			then
				local q_chars=$(( ${#cd} - ${#${cd//${~q}/}} )) 
				until (( ( ${#cd:h} - ${#${${cd:h}//${~q}/}} ) != q_chars ))
				do
					cd=${cd:h} 
				done
			else
				local q_chars=$(( ${#cd} - ${#${${cd:l}//${~${q:l}}/}} )) 
				until (( ( ${#cd:h} - ${#${${${cd:h}:l}//${~${q:l}}/}} ) != q_chars ))
				do
					cd=${cd:h} 
				done
			fi
			ZSHZ[CASE_INSENSITIVE]=0 
		fi
	fi
	if (( ret2 == 0 )) && [[ -n $cd ]]
	then
		if (( $+opts[-e] ))
		then
			(( ZSHZ_TILDE )) && cd=${cd/#${HOME}/\~} 
			print -- "$cd"
		else
			[[ -d $cd ]] && zshz_cd "$cd" && _zshz_echo
		fi
	else
		if ! (( $+opts[-e] || $+opts[-l] )) && [[ -d $req ]]
		then
			zshz_cd "$req" && _zshz_echo
		else
			return $ret2
		fi
	fi
}
# Shell Options
setopt alwaystoend
setopt autocd
setopt autopushd
setopt nobeep
setopt nocaseglob
setopt nocheckjobs
setopt completeinword
setopt extendedglob
setopt extendedhistory
setopt globdots
setopt nohashdirs
setopt histexpiredupsfirst
setopt histignoredups
setopt histignorespace
setopt histverify
setopt nohup
setopt interactivecomments
setopt login
setopt longlistjobs
setopt menucomplete
setopt pathdirs
setopt promptsubst
setopt pushdignoredups
setopt pushdsilent
setopt sharehistory
# Aliases
alias -- @g='/home/skogix/.local/bin/goose term run'
alias -- @goose='/home/skogix/.local/bin/goose term run'
alias -- a='ansible '
alias -- acon='ansible-console '
alias -- aconf='ansible-config '
alias -- adoc='ansible-doc '
alias -- agal='ansible-galaxy '
alias -- ainv='ansible-inventory '
alias -- aplaybook='ansible-playbook '
alias -- apull='ansible-pull '
alias -- arinit=ansible-role-init
alias -- aval=ansible-vault
alias -- aver=ansible-version
alias -- c=clear
alias -- cdi=zi
alias -- claude-mem='bun "/home/skogix/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
alias -- claude-skogai='claude --strict-mcp-config --mcp-config "/skogai/config/mcp.json" --setting-sources "project" --settings "/skogai/config/claude-settings.json" --no-chrome --dangerously-skip-permissions "$@"'
alias -- cleanup='sudo docker system prune -af && sudo pacman -Scc --noconfirm && yay -Scc --noconfirm'
alias -- commit='wt step commit --stage none'
alias -- commitadd='wt step commit --stage none'
alias -- commitall-aider='aider --commit --model openrouter/google/gemini-2.5-flash --no-gitignore'
alias -- current_branch=$'\n    print -Pu2 "%F{yellow}[oh-my-zsh] \'%F{red}current_branch%F{yellow}\' is deprecated, using \'%F{green}git_current_branch%F{yellow}\' instead.%f"\n    git_current_branch'
alias -- dbl='docker build'
alias -- dcin='docker container inspect'
alias -- dcls='docker container ls'
alias -- dclsa='docker container ls -a'
alias -- dib='docker image build'
alias -- dii='docker image inspect'
alias -- dils='docker image ls'
alias -- dipru='docker image prune -a'
alias -- dipu='docker image push'
alias -- dirm='docker image rm'
alias -- dit='docker image tag'
alias -- dlo='docker container logs'
alias -- dnc='docker network create'
alias -- dncn='docker network connect'
alias -- dndcn='docker network disconnect'
alias -- dni='docker network inspect'
alias -- dnls='docker network ls'
alias -- dnrm='docker network rm'
alias -- dpo='docker container port'
alias -- dps='docker ps'
alias -- dpsa='docker ps -a'
alias -- dpu='docker pull'
alias -- dr='docker container run'
alias -- drit='docker container run -it'
alias -- drm='docker container rm'
alias -- drm!='docker container rm -f'
alias -- drs='docker container restart'
alias -- dst='docker container start'
alias -- dsta='docker stop $(docker ps -q)'
alias -- dstp='docker container stop'
alias -- dsts='docker stats'
alias -- dtop='docker top'
alias -- dvi='docker volume inspect'
alias -- dvls='docker volume ls'
alias -- dvprune='docker volume prune'
alias -- dxc='docker container exec'
alias -- dxcit='docker container exec -it'
alias -- fdh='fd -H'
alias -- fdi='fd -i'
alias -- g=git
alias -- ga='git add'
alias -- gaa='git add --all'
alias -- gam='git am'
alias -- gama='git am --abort'
alias -- gamc='git am --continue'
alias -- gams='git am --skip'
alias -- gamscp='git am --show-current-patch'
alias -- gap='git apply'
alias -- gapa='git add --patch'
alias -- gapt='git apply --3way'
alias -- gau='git add --update'
alias -- gav='git add --verbose'
alias -- gb='git branch'
alias -- gbD='git branch --delete --force'
alias -- gba='git branch --all'
alias -- gbd='git branch --delete'
alias -- gbg='LANG=C git branch -vv | grep ": gone\]"'
alias -- gbgD='LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '\''{print $1}'\'' | xargs git branch -D'
alias -- gbgd='LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '\''{print $1}'\'' | xargs git branch -d'
alias -- gbl='git blame -w'
alias -- gbm='git branch --move'
alias -- gbnm='git branch --no-merged'
alias -- gbr='git branch --remote'
alias -- gbs='git bisect'
alias -- gbsb='git bisect bad'
alias -- gbsg='git bisect good'
alias -- gbsn='git bisect new'
alias -- gbso='git bisect old'
alias -- gbsr='git bisect reset'
alias -- gbss='git bisect start'
alias -- gc='git commit'
alias -- gc!='git commit --verbose --amend'
alias -- gcB='git checkout -B'
alias -- gca='git commit --verbose --all'
alias -- gca!='git commit --verbose --all --amend'
alias -- gcam='git commit --all --message'
alias -- gcan!='git commit --verbose --all --no-edit --amend'
alias -- gcann!='git commit --verbose --all --date=now --no-edit --amend'
alias -- gcans!='git commit --verbose --all --signoff --no-edit --amend'
alias -- gcas='git commit --all --signoff'
alias -- gcasm='git commit --all --signoff --message'
alias -- gcb='git checkout -b'
alias -- gcd='git checkout $(git_develop_branch)'
alias -- gcf='git config --list'
alias -- gcfu='git commit --fixup'
alias -- gcl='git clone --recurse-submodules'
alias -- gclean='git clean --interactive -d'
alias -- gclf='git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'
alias -- gcm='git checkout $(git_main_branch)'
alias -- gcmsg='git commit --message'
alias -- gcn='git commit --verbose --no-edit'
alias -- gcn!='git commit --verbose --no-edit --amend'
alias -- gco='git checkout'
alias -- gcor='git checkout --recurse-submodules'
alias -- gcount='git shortlog --summary --numbered'
alias -- gcp='git cherry-pick'
alias -- gcpa='git cherry-pick --abort'
alias -- gcpc='git cherry-pick --continue'
alias -- gcs='git commit --gpg-sign'
alias -- gcsm='git commit --signoff --message'
alias -- gcss='git commit --gpg-sign --signoff'
alias -- gcssm='git commit --gpg-sign --signoff --message'
alias -- gd='git diff'
alias -- gdca='git diff --cached'
alias -- gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias -- gdcw='git diff --cached --word-diff'
alias -- gds='git diff --staged'
alias -- gdt='git diff-tree --no-commit-id --name-only -r'
alias -- gdup='git diff @{upstream}'
alias -- gdw='git diff --word-diff'
alias -- gf='git fetch'
alias -- gfa='git fetch --all --tags --prune --jobs=10'
alias -- gfg='git ls-files | grep'
alias -- gfo='git fetch origin'
alias -- gg='git gui citool'
alias -- gga='git gui citool --amend'
alias -- ggpull='git pull origin "$(git_current_branch)"'
alias -- ggpur=ggu
alias -- ggpush='git push origin "$(git_current_branch)"'
alias -- ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias -- ghh='git help'
alias -- gignore='git update-index --assume-unchanged'
alias -- gignored='git ls-files -v | grep "^[[:lower:]]"'
alias -- git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
alias -- gk='\gitk --all --branches &!'
alias -- gke='\gitk --all $(git log --walk-reflogs --pretty=%h) &!'
alias -- gl='git pull'
alias -- glg='git log --stat'
alias -- glgg='git log --graph'
alias -- glgga='git log --graph --decorate --all'
alias -- glgm='git log --graph --max-count=10'
alias -- glgp='git log --stat --patch'
alias -- glo='git log --oneline --decorate'
alias -- glod='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias -- glods='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias -- glog='git log --oneline --decorate --graph'
alias -- gloga='git log --oneline --decorate --graph --all'
alias -- glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias -- glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias -- glols='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias -- glp=_git_log_prettily
alias -- gluc='git pull upstream $(git_current_branch)'
alias -- glum='git pull upstream $(git_main_branch)'
alias -- gm='git merge'
alias -- gma='git merge --abort'
alias -- gmc='git merge --continue'
alias -- gmff='git merge --ff-only'
alias -- gmom='git merge origin/$(git_main_branch)'
alias -- gms='git merge --squash'
alias -- gmtl='git mergetool --no-prompt'
alias -- gmtlvim='git mergetool --no-prompt --tool=vimdiff'
alias -- gmum='git merge upstream/$(git_main_branch)'
alias -- gp='git pull'
alias -- gpd='git push --dry-run'
alias -- gpf='git push --force-with-lease --force-if-includes'
alias -- gpf!='git push --force'
alias -- gpoat='git push origin --all && git push origin --tags'
alias -- gpod='git push origin --delete'
alias -- gpr='git pull --rebase'
alias -- gpra='git pull --rebase --autostash'
alias -- gprav='git pull --rebase --autostash -v'
alias -- gpristine='git reset --hard && git clean --force -dfx'
alias -- gprom='git pull --rebase origin $(git_main_branch)'
alias -- gpromi='git pull --rebase=interactive origin $(git_main_branch)'
alias -- gprum='git pull --rebase upstream $(git_main_branch)'
alias -- gprumi='git pull --rebase=interactive upstream $(git_main_branch)'
alias -- gprv='git pull --rebase -v'
alias -- gpsup='git push --set-upstream origin $(git_current_branch)'
alias -- gpsupf='git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes'
alias -- gpu='git push upstream'
alias -- gpv='git push --verbose'
alias -- gr='git remote'
alias -- gra='git remote add'
alias -- grb='git rebase'
alias -- grba='git rebase --abort'
alias -- grbc='git rebase --continue'
alias -- grbd='git rebase $(git_develop_branch)'
alias -- grbi='git rebase --interactive'
alias -- grbm='git rebase $(git_main_branch)'
alias -- grbo='git rebase --onto'
alias -- grbom='git rebase origin/$(git_main_branch)'
alias -- grbs='git rebase --skip'
alias -- grbum='git rebase upstream/$(git_main_branch)'
alias -- grev='git revert'
alias -- greva='git revert --abort'
alias -- grevc='git revert --continue'
alias -- grf='git reflog'
alias -- grh='git reset'
alias -- grhh='git reset --hard'
alias -- grhk='git reset --keep'
alias -- grhs='git reset --soft'
alias -- grm='git rm'
alias -- grmc='git rm --cached'
alias -- grmv='git remote rename'
alias -- groh='git reset origin/$(git_current_branch) --hard'
alias -- grrm='git remote remove'
alias -- grs='git restore'
alias -- grset='git remote set-url'
alias -- grss='git restore --source'
alias -- grst='git restore --staged'
alias -- grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias -- gru='git reset --'
alias -- grup='git remote update'
alias -- grv='git remote --verbose'
alias -- gs='git status'
alias -- gsb='git status --short --branch'
alias -- gsd='git svn dcommit'
alias -- gsh='git show'
alias -- gsi='git submodule init'
alias -- gsps='git show --pretty=short --show-signature'
alias -- gsr='git svn rebase'
alias -- gss='git status --short'
alias -- gst='git status'
alias -- gsta='git stash push'
alias -- gstaa='git stash apply'
alias -- gstall='git stash --all'
alias -- gstc='git stash clear'
alias -- gstd='git stash drop'
alias -- gstl='git stash list'
alias -- gstp='git stash pop'
alias -- gsts='git stash show --patch'
alias -- gstu='gsta --include-untracked'
alias -- gsu='git submodule update'
alias -- gsw='git switch'
alias -- gswc='git switch --create'
alias -- gswd='git switch $(git_develop_branch)'
alias -- gswm='git switch $(git_main_branch)'
alias -- gta='git tag --annotate'
alias -- gtl='gtl(){ git tag --sort=-v:refname -n --list "${1}*" }; noglob gtl'
alias -- gts='git tag --sign'
alias -- gtv='git tag | sort -V'
alias -- gunignore='git update-index --no-assume-unchanged'
alias -- gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'
alias -- gwch='git log --patch --abbrev-commit --pretty=medium --raw'
alias -- gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias -- gwipe='git reset --hard && git clean --force -df'
alias -- gwt='git worktree'
alias -- gwta='git worktree add'
alias -- gwtls='git worktree list'
alias -- gwtmv='git worktree move'
alias -- gwtrm='git worktree remove'
alias -- ham=task-master
alias -- hamster=task-master
alias -- jctl='journalctl -p 3 -xb'
alias -- l='eza -F --color=always --group-directories-first'
alias -- l.='eza -a | grep -E "^\."'
alias -- la='eza -a --color=always --group-directories-first'
alias -- ld=lazydocker
alias -- lg=lazygit
alias -- ll='eza -alF --color=always --group-directories-first --icons'
alias -- ls='eza --color=always --group-directories-first'
alias -- lsa='eza -a --color=always --group-directories-first'
alias -- lt='eza -aT --color=always --group-directories-first --icons'
alias -- lzd=lazydocker
alias -- lzg=lazygit
alias -- make='make -j$(nproc)'
alias -- n=ninja
alias -- naliases=n-aliases
alias -- ncd=n-cd
alias -- nenv=n-env
alias -- nfunctions=n-functions
alias -- nhelp=n-help
alias -- nhistory=n-history
alias -- ninja='ninja -j$(nproc)'
alias -- nkill=n-kill
alias -- noptions=n-options
alias -- npanelize=n-panelize
alias -- npmD='npm i -D '
alias -- npmE='PATH="$(npm bin)":"$PATH"'
alias -- npmF='npm i -f'
alias -- npmI='npm init'
alias -- npmL='npm list'
alias -- npmL0='npm ls --depth=0'
alias -- npmO='npm outdated'
alias -- npmP='npm publish'
alias -- npmR='npm run'
alias -- npmS='npm i -S '
alias -- npmSe='npm search'
alias -- npmU='npm update'
alias -- npmV='npm -v'
alias -- npmg='npm i -g '
alias -- npmi='npm info'
alias -- npmrb='npm run build'
alias -- npmrd='npm run dev'
alias -- npmst='npm start'
alias -- npmt='npm test'
alias -- oc=opencode
alias -- open=xdg-open
alias -- pbcopy='xclip -selection clipboard'
alias -- pbpaste='xclip -selection clipboard -o'
alias -- rgi='rg -i'
alias -- rgl='rg -l'
alias -- rgv='rg -v'
alias -- rip='expac --timefmt='\''%Y-%m-%d %T'\'' '\''%l\t%n %v'\'' | sort | tail -200 | nl'
alias -- rmpkg='sudo pacman -Rsn'
alias -- run-help=man
alias -- sg=ast-grep
alias -- sgr='ast-grep replace'
alias -- sgs='ast-grep search'
alias -- taskmaster=task-master
alias -- tm=task-master
alias -- update='sudo pacman -Syu'
alias -- uvi='uv pip install'
alias -- uvr='uv run'
alias -- uvs='uv sync'
alias -- uvv='uv venv'
alias -- which-command=whence
alias -- wts='wt select'
alias -- x=extract
alias -- z='zshz 2>&1'
alias -- zshenv='nvim ~/.config/zsh/.zshenv'
alias -- zshrc='nvim ~/.zshrc'
# Check for rg availability
if ! (unalias rg 2>/dev/null; command -v rg) >/dev/null 2>&1; then
  alias rg='/home/skogix/.local/share/claude/versions/2.1.49 --ripgrep'
fi
export PATH=/skogai/.local/bin\:/home/skogix/.cargo/bin\:/home/skogix/.local/src/argc-completions/bin\:/mnt/sda2/nvm/versions/node/v24.13.0/bin\:/home/skogix/.local/bin\:/home/skogix/bin\:/usr/local/bin\:/usr/local/sbin\:/home/skogix/.local/src/argc-completions/bin\:/mnt/sda2/npm/global/bin\:/mnt/sda2/pnpm/global/bin\:/home/skogix/.local/share/pnpm\:/home/skogix/.lmstudio/bin\:/home/skogix/.opencode/bin\:/home/skogix/.dotnet/tools\:/home/skogix/.cargo/bin\:/usr/bin\:/bin\:/usr/bin/site_perl\:/usr/bin/vendor_perl\:/usr/bin/core_perl\:/usr/lib/rustup/bin
