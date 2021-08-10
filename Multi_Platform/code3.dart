import 'code2.dart' as expans;

///Percobaan menggunakan dokumentasi comment
/**Fungsi [main] akan menghasilkan output
 * berupa hasil pengurutan dari list dari terkecil.
 * Selain itu, library [expans] digunakan sebagai 
 * expansion dari fungsilitas dari list yang 
 * masih kurang yakni pengurutan.
 */

void main() {
  var unsortedNumbers = [2, 5, 3, 1, 4];
  print(unsortedNumbers);
  var sortedNumbers = unsortedNumbers.sortAsc();
  print(sortedNumbers);
}
