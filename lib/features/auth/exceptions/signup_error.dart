enum SignUpError implements Exception {
	emailAlreadyExists;

	@override
	String toString() {
		switch(this) {
			case SignUpError.emailAlreadyExists:
				return "An account with this email already exists";
		}
	}
}
