// Approach 1: Additional Memory Approach (Use Sets)
    // Complexity Analysis

        //     Time Complexity: O(M × N) where M and N are the number of rows and columns respectively.
       //      Space Complexity: O(M + N) 
       
      //  Explanation:

     //     We traverse through the 2D array twice => Time: O(2 * m * n) = O(m * n)
     //     We use "rows" and "cols" which take O(m + n) in space

    //    Intuition

            // If any cell of the matrix has a zero we can record its row and column number. All the cells of                  this recorded row and column can be marked zero in the next iteration.

    //    Algorithm

   //     We make a pass over our original array and look for zero entries. 
   //     If we find that an entry at [i, j] is 0, then we need to record somewhere the row i and column j.
   //     So, we use two sets, one for the rows and one for the columns.

  //      if cell[i][j] == 0 
//      {
  //      row_set.add(i)
//        column_set.add(j)
//      }

//     Finally, we iterate over the original matrix. For every cell we check if the row r or column c had been marked earlier. If any of them was marked, we set the value in the cell to 0.

//      if r in row_set or c in column_set {
//          cell[r][c] = 0
//      }


class Solution {
    
func setZeroes(_ matrix: inout [[Int]]) {
	if matrix.isEmpty { return }

	let h = matrix.count
	let w = matrix[0].count
	var rows = Set<Int>()
	var cols = Set<Int>()

	for i in 0..<h {
		for j in 0..<w {
			if matrix[i][j] == 0 {
				rows.insert(i)
				cols.insert(j)
			}
		}
	}

	for i in 0..<h {
		for j in 0..<w {
			if rows.contains(i) || cols.contains(j) {
				matrix[i][j] = 0
			}
		}
	}
}
}

//testing function call

// var myMatrix = [[1,1,1],[1,0,1],[1,1,1]]
// func setZeroes(_ matrix: &myMatrix)

// Approach 2: O(1) Space, Efficient Solution (Set Flags)

// We will use the first row and column as flags

// Time: O(m * n), Space: O(1)

// Explanation: Similar to above with time. For space, since we're only using 3 variables, it's constant.

// Intuition

// Rather than using additional variables to keep track of rows and columns to be reset, we use the matrix itself as the indicators.

//     The idea is that we can use the first cell of every row and column as a flag. This flag would determine whether a row or column has been set to zero. This means for every cell instead of going to M+NM+NM+N cells and setting it to zero we just set the flag in two cells.

// if cell[i][j] == 0 {
//     cell[i][0] = 0
//     cell[0][j] = 0
// }

// These flags are used later to update the matrix. If the first cell of a row is set to zero this means the row should be marked zero. If the first cell of a column is set to zero this means the column should be marked zero.

// Algorithm

//    1. We iterate over the matrix and we mark the first cell of a row i and first cell of a column j, if the condition in the pseudo code above is satisfied. i.e. if cell[i][j] == 0.

//     2. The first cell of row and column for the first row and first column is the same i.e. cell[0][0]. Hence, we use an additional variable to tell us if the first column had been marked or not and the cell[0][0] would be used to tell the same for the first row.

//     3. Now, we iterate over the original matrix starting from second row and second column i.e. matrix[1][1] onwards. For every cell we check if the row r or column c had been marked earlier by checking the respective first row cell or first column cell. If any of them was marked, we set the value in the cell to 0. Note the first row and first column serve as the row_set and column_set that we used in the first approach.

//     4. We then check if cell[0][0] == 0, if this is the case, we mark the first row as zero.

//     5. And finally, we check if the first column was marked, we make all entries in it as zeros.

// https://leetcode.com/problems/set-matrix-zeroes/solution/ 

// In the above animation we iterate all the cells and mark the corresponding first row/column cell incase of a cell with zero value.

    // https://leetcode.com/problems/set-matrix-zeroes/Figures/73/MatrixZeros_18_1.png

// We iterate the matrix we got from the above steps and mark respective cells zeroes.

    // https://leetcode.com/problems/set-matrix-zeroes/Figures/73/MatrixZeros_18_2.png

// func setZeroes(_ matrix: inout [[Int]]) {
// 	if matrix.isEmpty { return }

// 	let h = matrix.count
// 	let w = matrix[0].count
// 	var isFirstColumn = false

// 	// mark rows and columns that has zeroes at their index 0
// 	for i in 0..<h {
// 		// check first column
// 		if matrix[i][0] == 0 { isFirstColumn = true }

// 		for j in 1..<w {
// 			if matrix[i][j] == 0 {
// 				matrix[i][0] = 0
// 				matrix[0][j] = 0
// 			}
// 		}
// 	}

// 	// set zeroes, except for first row and column
// 	for i in 1..<h {
// 		for j in 1..<w {
// 			if matrix[i][0] == 0 || matrix[0][j] == 0 {
// 				matrix[i][j] = 0
// 			}
// 		}
// 	}

// 	// check first row
// 	if matrix[0][0] == 0 {
// 		for j in 0..<w {
// 			matrix[0][j] = 0
// 		}
// 	}

// 	// check first column
// 	if isFirstColumn {
// 		for i in 0..<h {
// 			matrix[i][0] = 0
// 		}
// 	}
// }
