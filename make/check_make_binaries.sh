HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/definitions.sh
source $UTILS_PATH/platform_validator.sh
source $UTILS_PATH/args_make_binaries.sh
source $UTILS_PATH/program_validator.sh

if [[ $ARG_MAKE_BINARIES == $MAKE_BINARIES_TRUE ]]; then
    echo ""
    echo "--- MAKE BINARIES ON ---"
    if [[ $ARG_PROGRAM == $PROGRAM_CLIENT ]]; then
        ./mkclient.sh $ARG_PLATFORM_FULL
    elif [[ $ARG_PROGRAM == $PROGRAM_API ]]; then
        ./mkapi.sh $ARG_PLATFORM_FULL
    fi
else
    echo ""
    echo "--- MAKE BINARIES OFF ---"
    echo ""
fi
