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
    local newBinary = {}

    if lastPosPass ~= lastPosValue then
        print("\a\tERRO:::DIGITE VALORES COM A MESMA QUANTIDADE DE CARACTERES!")
        return false
    end

    for i = lastPosValue, 1, -1 do
        local res = self:xor(value[i], pass[i])
        table.insert(newBinary, 1, res)
    end

    local concatRes = table.concat(newBinary, "")
    return tonumber(concatRes, 2), newBinary
end

function OTP:descrypt(value)
    local lastPosValue = #value
    local lastPosPass = #self.password
    local newBinary = {}

    for i = lastPosValue, 1, -1 do
        local res = self:xor(value[i], self.password[i])
        table.insert(newBinary, 1, res)
    end

    local concatRes = table.concat(newBinary, "")
    return tonumber(concatRes, 2)
end

function OTP:xor(a, b)
    if a == b then
        return 0
    end

    return 1
end

return OTP
