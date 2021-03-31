# Shopify Notes

- login to Shopify

  - need a Shopify account
  - click a store name in the left nav to view and operate on it

- to view the products that have been added, click "Products" in the left nav
- each product has:
  - an image
  - Product (the name)
  - Status (ex. "Active")
  - Inventory (# in stock or "Inventory not tracked")
  - Type ("Liquid Pack" or "Supplement Oil")
  - Vendor ("ShopEverRoot" for all)
- to add a product, click the "Add product" button in the upper-right
- to edit an existing product, click its "Product" name

  - this provides an in-browser HTML editor (Polaris?)
  - to view the raw HTML,
    click the "<>" button in the upper-right of the editor
  - to add product images,
    drag and drop them into the Media area below the editor
    or click the "Add media from URL" link
  - under "Pricing", enter price and
    check the checkbox "Charge tax on this product"
  - under "Shipping", check "This is a physical product"
    and enter the weight if known
  - at the bottom of the page there are buttons to
    "Archive product" and "Delete product"
  - on the right side of the page
    - under "Product status" see the drop-down
      that can be set to "Active" or "Draft"
    - under Organization, see the drop-downs for
      Product type (ex. Supplement Oil) and
      Vendor (ex. ShopEverRoot)
    - under "TAGS", add tags like "brain health"

- to manage product inventory, click "Inventory" in the left nav

  - to add an existing product to the inventory, navigate to its product page
    and check "Track quantity" under Inventory
  - it takes 30 seconds or so to appear on the Inventory page

- to manage collections of products, click "Collections" in the left nav

  - to add a collection, click the "Create collection" button in the upper-right
  - to edit an existing collection, click its title in the list
  - enter a title and description for each collection
  - under "Conditions", select the associated "tags"
    that were assigned to the products
  - under "Products", order the products in the collection by "Best selling"

- to view the store page, click the eye icon
  next to "Online Store" in the left nav

  - this opens the site in a new tab
  - only the "Products" page is implemented by Shopify
  - the other links in the top nav go to the existing EverRoot Drupal site
    - includes Home, About, Ingredients, and Certifications
  - TODO: Where does the initial "Home" page come from?
    - It disappears when you click any of the top nav links.

- to customize the theme

  - click "Online Store" in the left nav
  - click "Themes"
  - to edit the code for the theme, including HTML and CSS
    - click the "Actions" drop-down and select "Edit code"
    - select a file to edit
    - edit in browser
    - see the file `Assets/theme.css`
  - to use the UI editor, click the "Customize" button
    to the right of the "Current theme" section

- to change a page

  - click "Online Store" in the left nav
  - click "Themes"
  - click "Customize"
  - select a page to edit from the drop-down at the top

- to change navigation

  - click "Online Store" in the left nav
  - click "Navigation"
  - select a menu or add one by clicking the "Add menu" button in the upper-right
  - ex. "Main menu"
  - after making changes, click the "Save menu" button

- to download all the theme files for a store

  - click "Online Store" in the left nav
  - click "Themes"
  - click "Actions"
  - select "Download theme file"
  - this will email a link to download a zip file containing all the files

- to recreate a token for using the Shopify REST API

  - click "Apps" in the left nav
  - scroll the bottom of the page and click the "Manage private apps" link
  - select the app (ex. test-everroot-app)
  - existing API keys are listed here
  - to create a new one, press the
    "Create new private app" button in the upper-right
  - to get the "Shared Secret", click the app name to the left of the API key
    and scroll down to "Shared Secret"

- to customize the Checkout page
  - click "Settings" in the lower-left
  - click "Checkout"
  - click "Customize checkout"
  - click "Theme Settings"
  - click "Checkout"
  - in the "LOGO" section click "custom image"

## Storefront API

- for documentation, browse <https://shopify.github.io/js-buy-sdk/>

  - see examples for code to perform various actions

- to enable use in an app

  - click the app in the left nav.
  - click "Apps" in the left nav.
  - scroll to the bottom of the page
  - click the "Manage private apps" link
  - click the name of the private app
  - scroll to the "Storefront API" section
  - check the checkboxes for "Read products, variants, and collections"
    and "Read and modify checkouts"
  - copy and save the "Storefront access token"

- to access from a web app using the "Shopify Storefront API JavaScript SDK"

  - in the top project directory, enter `npm install shopify-buy`
  - the code below demonstrates performing some common actions
    - begin by calling the `setup` function
    - call `addToCart` and `removeFromCart` to do what their name implies,
      passing an object with `name` and `id` properties
      where `id` is a product id
    - the product id is used to lookup the first variant id for the product,
      which assumes each product only has one variant
    - call `getCheckoutUrl` which provides the URL to navigate to
      in order to render the checkout page

```js
import Client from 'shopify-buy';

const STOREFRONT_ACCESS_TOKEN = 'supply-this';

const idToVariantMap = {};

let checkout;
let shopifyClient;

export async function addToCart(item) {
  const data = idToVariantMap[item.name];
  if (data) {
    await shopifyClient.checkout.addLineItems(checkout.id, [data]);
  } else {
    console.error('NO PRODUCT DATA FOUND FOR', item.name);
  }
}

export function getCheckoutUrl() {
  return checkout.webUrl;
}

export async function removeFromCart(item) {
  const data = idToVariantMap[item.name];
  if (data) {
    await shopifyClient.checkout.removeLineItems(checkout.id, [data]);
  } else {
    console.error('NO PRODUCT DATA FOUND FOR', item.name);
  }
}

export async function setup() {
  shopifyClient = Client.buildClient({
    domain: 'testeverroot.myshopify.com',
    storefrontAccessToken: STOREFRONT_ACCESS_TOKEN
  });

  // Create a checkout
  checkout = await shopifyClient.checkout.create();
  console.log('Results.svelte shopifySetup: checkout URL =', checkout.webUrl);

  const products = await shopifyClient.product.fetchAll();
  for (const product of products) {
    idToVariantMap[product.title] = {
      quantity: 1,
      variantId: product.variants[0].id
    };
  }
}
```
