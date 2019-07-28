#!/bin/sh


      case "$3" in
        close)
          pm-suspend 
          ;;
        *)
          logger "ACPI action undefined: $2"
          ;;
      esac
