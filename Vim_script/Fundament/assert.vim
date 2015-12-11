echo v:errors
echo assert_true(1 is 2)
echo v:errors
echo assert_true(1 is 2, 'ASSERT_HOGEHOGE_ERROR')
echo v:errors
echo assert_true(1 is 1, 'ASSERT_FOOFOO_ERROR')
echo v:errors

echo match(v:errors, 'ASSERT_HOGEHOGE_ERROR')
echo match(v:errors, 'ASSERT_FOOFOO_ERROR')
