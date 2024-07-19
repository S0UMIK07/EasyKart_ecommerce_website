<%-- 
    Document   : addToCart
    Created on : Aug 14, 2023, 1:19:15 PM
    Author     : 91731
--%>
<style>
   .soumik1 {
    --background: #362A89;
    --text: #fff;
    --soumik3: #fff;
    --tick: var(--background);
    position: relative;
    border: none;
    background: none;
    padding: 6px 20px;
    border-radius: 7px;
    -webkit-appearance: none;
    -webkit-tap-highlight-color: transparent;
    -webkit-mask-image: -webkit-radial-gradient(white, black);
    overflow: hidden;
    cursor: pointer;
    text-align: center;
    min-width: 130px;
    color: var(--text);
    background: var(--background);
    transform: scale(var(--scale, 1));
    transition: transform .4s cubic-bezier(.36, 1.01, .32, 1.27);
    &:active {
        --scale: .95;
    }
    .soumik2 {
        font-size: 14px;
        font-weight: 500;
        display: block;
        position: relative;
        padding-left: 20px;
        margin-left: -6px;
        line-height: 26px;
        transform: translateY(var(--soumik2-y, 0));
        transition: transform .7s ease;
        &:before,
        &:after {
            content: '';
            width: var(--w, 2px);
            height: var(--h, 14px);
            border-radius: 1px;
            position: absolute;
            left: var(--l, 8px);
            top: var(--t, 6px);
            background: currentColor;
            transform: scale(.75) rotate(var(--icon-r, 0deg)) translateY(var(--icon-y, 0));
            transition: transform .65s ease .05s;
        }
        &:after {
            --w: 14px;
            --h: 2px;
            --l: 2px;
            --t: 12px;
        }
    }
    .soumik3 {
        position: absolute;
        left: 50%;
        top: 50%;
        margin: -13px 0 0 -18px;
        transform-origin: 12px 23px;
        transform: translateX(-120px) rotate(-18deg);
        &:before,
        &:after {
            content: '';
            position: absolute;
        }
        &:before {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            box-shadow: inset 0 0 0 2px var(--soumik3);
            bottom: 0;
            left: 9px;
            filter: drop-shadow(11px 0 0 var(--soumik3));
        }
        &:after {
            width: 16px;
            height: 9px;
            background: var(--soumik3);
            left: 9px;
            bottom: 7px;
            transform-origin: 50% 100%;
            transform: perspective(4px) rotateX(-6deg) scaleY(var(--fill, 0));
            transition: transform 1.2s ease var(--fill-d);
        }
        .soumik4 {
            z-index: 1;
            width: 36px;
            height: 26px;
            display: block;
            position: relative;
            fill: none;
            stroke: var(--soumik3);
            stroke-width: 2px;
            stroke-linecap: round;
            stroke-linejoin: round;
            polyline {
                &:last-child {
                    stroke: var(--tick);
                    stroke-dasharray: 10px;
                    stroke-dashoffset: var(--offset, 10px);
                    transition: stroke-dashoffset .4s ease var(--offset-d);
                }
            }
        }
    }
    &.loading {
        --scale: .95;
        --soumik2-y: -32px;
        --icon-r: 180deg;
        --fill: 1;
        --fill-d: .8s;
        --offset: 0;
        --offset-d: 1.73s;
        .soumik3 {
            animation: soumik3 3.4s linear forwards .2s;
        }
    }
}

@keyframes soumik3 {
    12.5% {
        transform: translateX(-60px) rotate(-18deg);
    }
    25%,
    45%,
    55%,
    75% {
        transform: none;
    }
    50% {
        transform: scale(.9);
    }
    44%,
    56% {
        transform-origin: 12px 23px;
    }
    45%,
    55% {
        transform-origin: 50% 50%;
    }
    87.5% {
        transform: translateX(70px) rotate(-18deg);
    }
    100% {
        transform: translateX(140px) rotate(-18deg);
    }
}
.button-container {
  display: inline-block;
  padding: 8px 10px;
  background-color: #007bff;
  border: none;
  color: white;
  cursor: pointer;
  font-size: 14px;
  text-align: center;
  text-decoration: none;
  border-radius: 7px;
  transition: background-color 0.3s, transform 0.2s;
  position: relative;
}

.button-container:hover {
  background-color: #0056b3;
  transform: scale(1.05);
}

.price-container {
  display: flex;
  align-items: center;
}

.original-price {
  text-decoration: line-through;
  color: #555;
  margin-right: 8px;
  font-size: 12px;
}

.discount-percentage {
  color: #e74c3c;
  font-weight: bold;
  margin-right: 8px;
  font-size: 12px;
}

.discounted-price {
  font-size: 14px;
  font-weight: bold;
}

/* Additional style for improved visibility */
.button-container:hover .price-container {
  opacity: 1;
}
.hover-div {
            border-top: 1px solid #f8f8f8;
            background: #f8f8f8;
            box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.2);
            -webkit-transition: all 0.3s;
            transition: all 0.3s;
            margin: 10px 0px;
        }
        
        .hover-div:hover {
            -webkit-transform: translateY(-20px);
            -ms-transform: translateY(-20px);
            transform: translateY(-20px);
            box-shadow: 0 22px 43px rgba(0, 0, 0, 0.32);
            cursor: pointer;
            border-radius: 5px;
        }
</style>

