function seed(key, digit)
    -- 随机数种子
    math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    local self = {}
    local value = nil
    local keyToRedo = ''
    local valueToRedo = ''
    self.key = key
    if digit == nil then
        digit = 16
    end
    --参数为空赋默认值
    if key == nil or key == '' then
        for i = 1, digit do
            valueToRedo = valueToRedo .. math.random(0, 9)
        end
        key = valueToRedo
        self.key = valueToRedo
        valueToRedo = ''
    end
   --防止开头有0
    while (string.len(key) % digit ~= 0) do
        key = 0 .. key
    end
    --字符转为数字
    for i = 1, string.len(key) do
        keyToRedo = keyToRedo .. string.sub(key, i, i):byte() * i * 9 % 10
    end
    while (string.len(keyToRedo) % digit ~= 0) do
        keyToRedo = keyToRedo .. (string.len(keyToRedo) % digit * 7) % 10
    end
    --将位数转为规定位数
    local multiple = string.len(keyToRedo) % digit
    for i = 1, digit do
        valueToRedo = valueToRedo .. string.sub(keyToRedo, i + multiple, i + multiple)
    end
    --转换为value
    value = string.reverse(valueToRedo)
    self.value = value
    return self
end
