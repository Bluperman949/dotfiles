
syn region logWarning start=+^.*WARN+ end=+^[^	 ]\@=+
syn region logError   start=+^.*ERR+  end=+^[^	 ]\@=+
hi link logWarning GruvboxOrange
hi link logError GruvboxRedBold
