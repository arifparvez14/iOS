import UIKit

//Three step to handle error

//Design Error (1/3)
enum HeightError : Error{
    case maxHeight
    case minHeight
}

//call function (2/3)
func checkHeightError(height: Int) throws{
    if height > 200{
        throw HeightError.maxHeight
    }
    else if height < 140{
        throw HeightError.minHeight
    }
    else{
        print("Enjoy")
    }
}

//Handle with Error (3/3)
do{
    try checkHeightError(height: 400)
}catch HeightError.maxHeight{
    print("You are too long")
}catch HeightError.minHeight{
    print("You are too long")
}
