defmodule RFC2822.DateTimeTest do
  use ExUnit.Case

  doctest RFC2822.DateTime

  describe "parse/1" do
    test "parses standard strings" do
      dates = %{
        "Thu, 05 Jan 2023 13:05:59 GMT" => ~U[2023-01-05 13:05:59Z],
        "Thu, 20 Oct 2022 08:18:08 GMT" => ~U[2022-10-20 08:18:08Z],
        "Sun, 22 Jan 2023 01:20:29 GMT" => ~U[2023-01-22 01:20:29Z],
        "Sun, 15 Jan 2023 09:54:00 GMT" => ~U[2023-01-15 09:54:00Z],
        "Sat, 21 Jan 2023 23:30:02 GMT" => ~U[2023-01-21 23:30:02Z],
        "Wed, 1 Feb 2023 20:38:44 GMT" => ~U[2023-02-01 20:38:44Z],
        "Fri, 27 Jan 2023 19:01:27 GMT" => ~U[2023-01-27 19:01:27Z],
        "Fri, 27 Jan 2023 16:21:14 GMT" => ~U[2023-01-27 16:21:14Z],
        "Sat, 28 Jan 2023 13:05:44 GMT" => ~U[2023-01-28 13:05:44Z],
        "Fri, 27 Jan 2023 06:53:18 GMT" => ~U[2023-01-27 06:53:18Z],
        "Mon, 29 Aug 2022 01:14:43 GMT" => ~U[2022-08-29 01:14:43Z],
        "Mon, 30 Jan 2023 08:57:37 GMT" => ~U[2023-01-30 08:57:37Z],
        "Sat, 03 Dec 2022 03:33:36 GMT" => ~U[2022-12-03 03:33:36Z],
        "Sun, 29 Jan 2023 03:37:42 GMT" => ~U[2023-01-29 03:37:42Z],
        "Thu, 2 Feb 2023 11:05:04 GMT" => ~U[2023-02-02 11:05:04Z],
        "Thu, 15 Dec 2022 13:47:33 GMT" => ~U[2022-12-15 13:47:33Z],
        "Sat, 21 Jan 2023 22:06:47 GMT" => ~U[2023-01-21 22:06:47Z],
        "Thu, 02 Feb 2023 11:16:15 GMT" => ~U[2023-02-02 11:16:15Z],
        "Thu, 02 Feb 2023 10:45:31 GMT" => ~U[2023-02-02 10:45:31Z],
        "Fri, 24 Sep 2021 08:32:30 GMT" => ~U[2021-09-24 08:32:30Z],
        "Tue, 31 Jan 2023 22:45:12 GMT" => ~U[2023-01-31 22:45:12Z]
      }

      Enum.map(dates, fn {string, datetime} ->
        assert RFC2822.DateTime.parse(string) == {:ok, datetime}
      end)
    end

    test "parses non-standard strings using 'UTC' as zone" do
      dates = %{"Thu, 05 Jan 2023 13:05:59 UTC" => ~U[2023-01-05 13:05:59Z]}

      Enum.map(dates, fn {string, datetime} ->
        assert RFC2822.DateTime.parse(string) == {:ok, datetime}
      end)
    end

    test "returns an error when the string is invalid" do
      assert RFC2822.DateTime.parse("bad") == {:error, :invalid_format}
    end
  end

  test "to_string" do
    dates = %{
      "Thu, 05 Jan 2023 13:05:59 GMT" => ~U[2023-01-05 13:05:59Z],
      "Thu, 20 Oct 2022 08:18:08 GMT" => ~U[2022-10-20 08:18:08Z],
      "Sun, 22 Jan 2023 01:20:29 GMT" => ~U[2023-01-22 01:20:29Z],
      "Sun, 15 Jan 2023 09:54:00 GMT" => ~U[2023-01-15 09:54:00Z],
      "Sat, 21 Jan 2023 23:30:02 GMT" => ~U[2023-01-21 23:30:02Z],
      "Wed, 01 Feb 2023 20:38:44 GMT" => ~U[2023-02-01 20:38:44Z],
      "Fri, 27 Jan 2023 19:01:27 GMT" => ~U[2023-01-27 19:01:27Z],
      "Fri, 27 Jan 2023 16:21:14 GMT" => ~U[2023-01-27 16:21:14Z],
      "Sat, 28 Jan 2023 13:05:44 GMT" => ~U[2023-01-28 13:05:44Z],
      "Fri, 27 Jan 2023 06:53:18 GMT" => ~U[2023-01-27 06:53:18Z],
      "Mon, 29 Aug 2022 01:14:43 GMT" => ~U[2022-08-29 01:14:43Z],
      "Mon, 30 Jan 2023 08:57:37 GMT" => ~U[2023-01-30 08:57:37Z],
      "Sat, 03 Dec 2022 03:33:36 GMT" => ~U[2022-12-03 03:33:36Z],
      "Sun, 29 Jan 2023 03:37:42 GMT" => ~U[2023-01-29 03:37:42Z],
      "Thu, 02 Feb 2023 11:05:04 GMT" => ~U[2023-02-02 11:05:04Z],
      "Thu, 15 Dec 2022 13:47:33 GMT" => ~U[2022-12-15 13:47:33Z],
      "Sat, 21 Jan 2023 22:06:47 GMT" => ~U[2023-01-21 22:06:47Z],
      "Thu, 02 Feb 2023 11:16:15 GMT" => ~U[2023-02-02 11:16:15Z],
      "Thu, 02 Feb 2023 10:45:31 GMT" => ~U[2023-02-02 10:45:31Z],
      "Fri, 24 Sep 2021 08:32:30 GMT" => ~U[2021-09-24 08:32:30Z],
      "Tue, 31 Jan 2023 22:45:12 GMT" => ~U[2023-01-31 22:45:12Z]
    }

    Enum.map(dates, fn {string, datetime} ->
      assert RFC2822.DateTime.to_string(datetime) == string
    end)
  end
end
