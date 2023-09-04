local OTP = {}

function OTP:create(value, password)
    self.value = self:convertToBinary(value)
    self.password = self:convertToBinary(password)
    return self:encrypt(self.value, self.password)
end

function OTP:convertToBinary(n)
    local binary = {}

    while n > 0 do
        local remainder = n % 2
        table.insert(binary, 1, remainder)
        n = math.floor(n / 2)
    end

    return binary
end

function OTP:encrypt(value, pass)
    local lastPosValue = #value
    local lastPosPass = #pass
    local res = 0
    local newBinary = {}

    -- adiciona 0 no começo do menor valor
    if lastPosValue < lastPosPass then
        for i = 1, lastPosPass - lastPosValue, 1 do
            table.insert(value, 1, '0')
        end
    elseif lastPosValue > lastPosPass then
        for i = 1, lastPosValue - lastPosPass, 1 do
            table.insert(pass, 1, '0')
        end
    end

    for i = lastPosValue, 1, -1 do
        res = self:xor(value[i], pass[i])
        table.insert(newBinary, 1, res)
    end

    return newBinary
end

function OTP:xor(a, b)
    if (a == '0' and b == '0') or (a == '1' and b == '1') then
        return "0"
    end

    return "1"
end

return OTP
