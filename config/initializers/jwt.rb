
JWT_SECRET = '72304b8f1e83c86ed7c881e95559ab73a636a270cd6fc0adee19a1bb12f8337ff17ea403ac40331e218cb47f030b4c1073f45f778ede4b463cf6d655c6cb7fdd
'
JWT_ALGORITHM = 'HS256'
JWT_EXPIRATION = 24.hours.to_i

def encode_token(payload)
  JWT.encode(payload, JWT_SECRET, JWT_ALGORITHM)
end

def decode_token(token)
  JWT.decode(token, JWT_SECRET, true, algorithm: JWT_ALGORITHM).first
end
