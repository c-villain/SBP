public typealias Command = (() -> ())
public typealias CommandWith<T> = (T) -> ()

typealias EventHandler<T> = ((T) -> Void)
public typealias VoidClosure = () -> Void
