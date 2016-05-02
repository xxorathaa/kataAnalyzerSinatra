import unittest

class NumberConverterTest(unittest.TestCase):

    def test_that_one_is_one(self):
        self.assertEqual(1,1)

    def test_that_two_is_two(self):
        self.assertEqual(2,2)

if __name__ == '__main__':
    unittest.main()
