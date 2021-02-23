module PageTransition = {

    module Styles = {
        open! Cn
        open Emotion

        module Wrapper = {
            let shared = css(list{
                width(#pct(70.)),
                height(#pct(70.)),
                top(#pct(0.))
            })

            let make = () => fromList(list{
                shared
            })
        }

        let fadeUp = keyframes(list{
            (0, list{
                opacity(1.),
                top(#pct(0.))
            }),
            (70, list{
                opacity(0.),
            }),
            (100, list{
                top(#pct(-20.))
            })
        })

        let fadeIn = keyframes(list{
            (0, list{
                opacity(0.),
                top(#pct(-20.))
            }),
            (70, list{
                opacity(0.),
            }),
            (100, list{
                top(#pct(0.))
            })
        })

        let shared = css(list{
            animationFillMode(#forwards),
            position(#absolute),
            fontSize(#px(50)),
        })

        let previous = css(list{
            animationName(fadeUp),
            animationDuration(#ms(500)),
            animationTimingFunction(#linear)
        })

        let current = css(list{
            animationName(fadeIn),
            animationDuration(#ms(500)),
            animationTimingFunction(#linear)
        })

        let makePrevious = () => fromList(list{
            shared,
            previous
        })

        let makeCurrent = () => fromList(list{
            shared,
            current
        })
    }

    let usePageTransition = (~url, ~currentPage) => {
        let url = url->Js.Json.stringifyAny

        let (previousRoute, setPreviousRoute) = React.useState(_ => (url, currentPage))
        
        let (previousUrl, previousPage) = previousRoute
        let shouldTransition = !Lodash.isEqual(previousUrl, url)
        
        Js.log2("shouldTransition", shouldTransition)
        let transitionDuration = 500

        React.useEffect1(_ => {
            Js.log("url changed")
            // debounce this by transitionDuration so the animation wont trigger while its being animated
            let _ = Js.Global.setTimeout(_ => {
                setPreviousRoute(_ => (url, currentPage))
            }, transitionDuration)
            None
        }, [url])

        (
            <div
                className={Cn.fromList(list{
                    Styles.Wrapper.make()
                })}
            >
                {switch shouldTransition {
                    | true => (
                        <div
                            key={previousUrl->Belt.Option.getWithDefault("")}
                            className=(Cn.fromList(list{
                                Styles.makePrevious()
                            }))
                        >
                            {previousPage}
                        </div>
                    )
                    | false => <></>
                }}
                
                <div
                    key={url->Belt.Option.getWithDefault("")}
                    className=(Cn.fromList(list{
                        Styles.makeCurrent()
                    }))
                >
                    {currentPage}
                </div>
            </div>
        )
        
    }
}

module Styles = {
    open! Cn
    open Emotion

    let shared = css(list{
        backgroundColor(KitchenUiKit.Colors.Gray.Light.default),
        width(#vw(100.)),
        height(#vh(100.)),
        KitchenUiKit.Typography.condensed
    })

    let make = () => fromList(list{
        shared
    })
}
@react.component
let make = () => {
    // let (currentPage) = PageTransition.usePageTransition(~url, ~currentPage)

    <div
        className={Cn.fromList(list{
            Styles.make()
        })}
    >
        <Router/>
    </div>
}