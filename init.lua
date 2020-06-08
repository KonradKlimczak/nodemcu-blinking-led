if not tmr.create():alarm(5000, tmr.ALARM_SINGLE, function()
  print("hey there")
end)
then
  print("whoopsie")
end
print('set up mode')
gpio.mode(1, gpio.OUTPUT)

function dark()
    print('write low')
    gpio.write(1, gpio.LOW)
    print('read mode')
    print(gpio.read(1))
end

function light()
    print('write high')
    gpio.write(1, gpio.HIGH)
    print('read mode')
    print(gpio.read(1))
end

function blik()
  print('light')
  light()
  tmr.delay(1000000)
  print('dark')
  dark()
end

lighttimer = tmr.create()
lighttimer:register(3000, tmr.ALARM_AUTO, light)

darktimer = tmr.create()
darktimer:register(1500, tmr.ALARM_AUTO, dark)

darktimer:start()
lighttimer:start()

