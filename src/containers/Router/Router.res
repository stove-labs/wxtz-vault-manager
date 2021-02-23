@react.component
let make = () => {
    let url = ReasonReactRouter.useUrl()

    switch (url.path) {
        | list{} => <WalletConnector/>
        | _ => {
            ReasonReactRouter.push("/")
            <></>
        }
    }
}