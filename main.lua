local OTP = require('Scripts.OTP')

local res = OTP:create(164, 205)

for i, n in ipairs(res) do
    print(n)
end

