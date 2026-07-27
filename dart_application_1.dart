void main() {
  // ================= Task 1 =================

  Set<int> a = {1, 2, 3, 4};
  Set<int> b = {3, 4, 5, 6};

  Set<int> result = a.intersection(b);

  print("Task 1:");
  print(result);

  // ================= Task 2 =================

  String text = "hello world";

  Set<String> letters = text.split('').toSet();

  print("\nTask 2:");
  print(letters);

  // ================= Task 3 =================

  String word = "banana";

  Map<String, int> count = {};

  for (String letter in word.split('')) {
    if (count.containsKey(letter)) {
      count[letter] = count[letter]! + 1;
    } else {
      count[letter] = 1;
    }
  }

  print("\nTask 3:");
  print(count);

  // ================= Task 4 =================

  Map<String, int> scores = {"Ali": 85, "Sara": 92, "Omar": 78};

  String topStudent = "";
  int topScore = 0;

  scores.forEach((name, score) {
    if (score > topScore) {
      topScore = score;
      topStudent = name;
    }
  });

  print("\nTask 4:");
  print(topStudent);
}
