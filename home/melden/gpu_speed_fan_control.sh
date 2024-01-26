#!/bin/bash
# Control AMD GPU videocard fan speed based on real GPU temperature under GNU/Linux
# Just using the open-source AMDGPU driver, part of the kernel
# By: Melroy van den Berg <melroy@melroy.org>

############## Documentation #################
# Note 1: Temps are in Degrees Celsius
# Note 2: Fan speeds are in PWM (0-255 range) - which is NOT the same as RPM!
#
# You should read it like such: Until 48 degrees (temp1) is reached,
# the fan speed remains zero.
# And up until 52 degrees (temp2) is reached, the fan speed will stay on 32 PWM (=just on). Etc. etc.
##############################################

################# Settings ###################
# Temp 1: Fans are off (0) until temp1 is reached
temp1=48
fan_speed1=0
# Temp 2: Fans are almost not audible
temp2=52
fan_speed2=32
# Temp 3: Fans are slowly spinning at 45 PWM
temp3=57
fan_speed3=50
# Temp 4: Fans are a bit noisy
temp4=65
fan_speed4=80
# Temp 5: Fans are noticeable
temp5=75
fan_speed5=120
# Temp 6: Fans are pretty loud now, also needed due to the temperature
temp6=82
fan_speed6=200

# Finally, above temp6 limit, use the max fan speed
fan_max_speed=255

# Wait period between readings (in seconds)
wait=8

#############################################
#      Do NOT edit below this line!         #
#############################################

read_temp() {
    temp=$(cat /sys/class/hwmon/hwmon0/temp1_input)
    temp=$(($temp / 1000))
    return $temp
}

enable_auto_mode() {
    su -c 'echo 2 > /sys/class/hwmon/hwmon0/pwm1_enable' root
}

enable_manual_mode() {
    # Enable manual fan control (1) iso auto
    su -c 'echo 1 > /sys/class/hwmon/hwmon0/pwm1_enable' root
}

disable_fan_control_mode() {
    su -c 'echo 0 > /sys/class/hwmon/hwmon0/pwm1_enable' root
}

set_fan_speed() {
    su -c "echo $1 > /sys/class/hwmon/hwmon0/pwm1" root
}

# Enable manual fan speed control
enable_manual_mode
# Disable fans fully
set_fan_speed 0
# Read temp in Celsius
read_temp
echo "Current temp: $?°C"
sleep 2

current_fan_speed=0
# Main control loop
while true; do
    # Read new temp
    read_temp
    current_temp=$?
    if ((current_temp <= temp1)); then
        if ((current_fan_speed != fan_speed1)); then
            set_fan_speed $fan_speed1
            current_fan_speed=$fan_speed1
        fi
    elif ((current_temp > temp1 && current_temp <= temp2)); then
        if ((current_fan_speed != fan_speed2)); then
            set_fan_speed $fan_speed2
            current_fan_speed=$fan_speed2
        fi
    elif ((current_temp > temp2 && current_temp <= temp3)); then
        if ((current_fan_speed != fan_speed3)); then
            set_fan_speed $fan_speed3
            current_fan_speed=$fan_speed3
        fi
    elif ((current_temp > temp3 && current_temp <= temp4)); then
        if ((current_fan_speed != fan_speed4)); then
            set_fan_speed $fan_speed4
            current_fan_speed=$fan_speed4
        fi
    elif ((current_temp > temp4 && current_temp <= temp5)); then
        if ((current_fan_speed != fan_speed5)); then
            set_fan_speed $fan_speed5
            current_fan_speed=$fan_speed5
        fi
    elif ((current_temp > temp5 && current_temp <= temp6)); then
        if ((current_fan_speed != fan_speed6)); then
            set_fan_speed $fan_speed6
            current_fan_speed=$fan_speed6
        fi
    else
        if ((current_fan_speed != fan_max_speed)); then
            # Max
            set_fan_speed $fan_max_speed
            current_fan_speed=$fan_max_speed
        fi
    fi
    # Sleep 8 sec.
    sleep $wait
done
