# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
import algorithm

import natcmp
test "can cmp":
  var testseq = @["test1.jpg", "test02.xml", "test2.jpg", "test10.jpg", "test20.jpg", "test 3.jpg", "test02.jpg", "TEST1.jpg", "test3.jpg", "嘘喰い 37", " 嘘喰い 9", "ヴィンランド・サガ（１）", "マテリアル・パズル～神無き世界の魔法使い～（１）"]
  sort(testseq, strnatcmp)
  echo testseq
  check testseq == @["TEST1.jpg", "test1.jpg", "test02.jpg", "test02.xml", "test2.jpg", "test 3.jpg", "test3.jpg", "test10.jpg", "test20.jpg", "マテリアル・パズル～神無き世界の魔法使い～（１）", "ヴィンランド・サガ（１）", " 嘘喰い 9", "嘘喰い 37"]
