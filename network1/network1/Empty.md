#  <#Title#>

struct Movie: Codable {
    let title: String
    let image: String
}

struct MovieResponse: Codable {
    let data: [Movie]
}

func doIt(data: Data?, response: URLResponse?, error: Error?) {
    print("do it!!!", data)
    // Data -> Swift Data Type
    do {
        let ret = try JSONDecoder().decode(MovieResponse.self, from: data!)
//        print("ret :", ret.data)
        for item in ret.data {
            print(item.title)
        }
    }
    catch {
        print("Error", error)
    }
}

func fetchMovieList() {
    print("fetchMovieList")
    // 1. URL
    let urlStr = "http://mynf.codershigh.com:8080/api/movies"
    let url = URL(string: urlStr)!
    
    // 2. Request
    let request = URLRequest(url: url)
        
    // 3. Session, Task
//    let task = URLSession.shared.dataTask(with: request, completionHandler: doIt(data:response:error:))
//    task.resume()
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        do {
            let ret = try JSONDecoder().decode(MovieResponse.self, from: data!)
    //        print("ret :", ret.data)
            for item in ret.data {
                print(item.title)
            }
        }
        catch {
            print("Error", error)
        }
    }.resume()
}

struct LoginInfo: Codable {
    let id: String
    let password: String
}

struct LoginResult: Codable {
    let token: String
    let isAdmin: Bool
    let name: String
}

struct LoginResponse: Codable {
    let message: String
    let data: LoginResult
}

// POST
func tryLogin(id: String, pw: String) {
    let url = URL(string: "http://mynf.codershigh.com:8080/api/auth/login")!
    
    var request = URLRequest(url: url)
    request.httpMethod = "post"
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let info = LoginInfo(id: id, password: pw)
    let data: Data = try! JSONEncoder().encode(info)
    request.httpBody = data
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        print("data :", data, error)
        let ret = try! JSONDecoder().decode(LoginResponse.self, from: data!)
        print("token :", ret.data.token)
    }.resume()
}

//fetchMovieList()
tryLogin(id: "user1", pw: "1234")
dispatchMain()
