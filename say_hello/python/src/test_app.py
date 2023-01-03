import hello

class TestHello:
    def test_format(self):
        actual = hello.format("John")
        expected = "(Python) Hello John!"
        assert actual == expected

