#export

_jenv_export_hook() {
  ERRCODE=$?
  export JAVA_HOME=$(jenv javahome)
  export JENV_FORCEJAVAHOME=true

  if [ -e "$JAVA_HOME/bin/javac" ]
  then
    export JDK_HOME=$(jenv javahome)
    export JENV_FORCEJDKHOME=true
  fi
  $(exit $ERRCODE)
}

if ! [[ "$PROMPT_COMMAND" =~ _jenv_export_hook ]]; then
    PROMPT_COMMAND="_jenv_export_hook;$PROMPT_COMMAND";
fi


_jenv_export_hook
