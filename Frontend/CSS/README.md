# Cascading Styles Sheets(CSS)

## Note

- 後面程式會覆蓋前面程式 style

- Responsive Web Design 簡稱 RWD，又稱適應性網頁、響應式網頁設計、回應式網頁設計、多螢網頁設計，一站解決多種裝置顯示問題

## 使用方法

- Inline: 直接將 css 寫在 html tag，一般開發會希望 html 是獨立的，所以盡量避免使用這方法

- Internal: 會寫在 html head 得部分，套用整個 html，相對於 **Inline** 來的好，但 html 和 css 還是寫在同個 file

- External: css 會獨立成一個 file 再透過 html 引入使用，也是一個相對好的方法

## Selectors, Properties, and Values

- Selectors: 可以利用 internal 或 external 的方式來改變 html tag 的 style

    - 單純使用 tag name (ex:body) 的話會針對 html 中所有相同 tag 都會有相同 style

        ```
        body {
            font-size: 14px;
            color: navy;
        }
        ```

    - #+ tag name (ex:#block) 就會針對 id 部分修改 style

         ```
        #block {
            font-size: 14px;
            color: navy;
        }
        ``
- Properties: 在 Selectors 中所使用到的那些東西就是 property (ex: color, font-size)

- Values: property 所對應到的值 (ex: color: navy 中的 navy)

## Reference

- [html dog](https://www.htmldog.com/guides/css/beginner/)

