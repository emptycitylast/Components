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

    while (string.len(key) % digit ~= 0) do
        key = 0 .. key
    end

    for i = 1, string.len(key) do
        keyToRedo = keyToRedo .. string.sub(key, i, i):byte() * i * 9 % 10
    end
    while (string.len(keyToRedo) % digit ~= 0) do
        keyToRedo = keyToRedo .. (string.len(keyToRedo) % digit * 7) % 10
    end

    local multiple = string.len(keyToRedo) % digit
    for i = 1, digit do
        valueToRedo = valueToRedo .. string.sub(keyToRedo, i + multiple, i + multiple)
    end

    value = string.reverse(valueToRedo)

    self.value = value
    return self
end
print(seed('时间计算机', 10).key, seed('时间计算机', 10).value)
