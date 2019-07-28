#!/bin/sh

      case "$4" in
        00000000)
          echo -n 50 > /sys/class/backlight/intel_backlight/brightness
          ;;
        00000001)
          echo -n 100 > /sys/class/backlight/intel_backlight/brightness
          ;;
      esac
