

def ftoc(fNum)
  cNum = (fNum.to_f - 32.0) / 1.8

  cNum.round
end


def ctof(cNum)
  (cNum * 9.0 / 5) + 32
end
