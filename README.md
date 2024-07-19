# EasyKart - Ecommerce Platform

## Description
Developed a robust Ecommerce website with advanced backend functionality. Successfully implemented user authentication, efficient product management, and secure checkout using the Razorpay payment gateway.

## Features
### User Features
- **Authentication:** Secure login/signup with encrypted password storage.
- **Product Management:** Users can browse products, add to cart, and manage their shopping cart.
- **Checkout:** Secure checkout process integrated with Razorpay payment gateway (Test Mode).
- **Profile Management:** Users can view and edit their profiles.
- **Order Tracking:** Users can track the status of their orders in the "My Orders" section.

### Admin Features
- **Category Management:** Admins can add, edit, and delete product categories.
- **Product Management:** Admins can add, edit, and delete products based on categories.
- **User Management:** Admins can view and manage all user profiles.
- **Order Management:** Admins can confirm orders, manage shipment and payment status, and view delivery addresses.
- **Security:** Access to the admin module is restricted to authorized users.

## Technology Stack
- **Frontend:** JSP, HTML, CSS, Bootstrap, SweetAlert
- **Backend:** Java, Servlets, Hibernate
- **Database:** MySQL
- **Tools:** NetBeans IDE, Maven
- **Server:** Deployed on Tomcat Server (localhost)

## Installation
## Setup Instructions

1. Clone the repository to your local machine.
2. Set up a local Tomcat server version 10 or above on your machine.
3. Import the project into your preferred IDE (e.g., NetBeans).
4. Ensure that Maven dependencies are resolved.
5. Configure the database connection settings in the `hibernate.cfg.xml` file.
6. Update your project's web application deployment descriptor (`web.xml`) to support Servlet 5.0, which is required for Tomcat 10.
7. Run the application on the local Tomcat server. Make sure to specify the correct Tomcat version in your IDE's run configurations.

These steps ensure compatibility with Tomcat version 10 and above. If you encounter any issues during setup or runtime, refer to the Tomcat documentation for version-specific guidance or consult the project's issue tracker on GitHub.

## Usage

1. **Access the application:**
   - Open your web browser and navigate to `http://localhost:8080/easykart`.

2. **User Functions:**
   - **Register:** If you are a new user, click on the registration link and fill in the required details to create a new account.
   - **Login:** Enter your credentials to log in to your account.
   - **Browse Products:** Explore available products on the homepage or product listing pages.
   - **Add to Cart:** Select products and add them to your shopping cart.
   - **Checkout:** Review your cart and proceed to checkout. Complete the payment process using the Razorpay payment gateway (Test Mode).
   - **Profile Management:** Access and edit your profile details from the user account section.
   - **Order Tracking:** Go to the "My Orders" section to track the status of your past orders.

3. **Admin Functions:**
   - **Login:** Enter your admin credentials to access the admin panel.
   - **Manage Categories:** Add, edit, or delete product categories.
   - **Manage Products:** Add new products, edit existing products, or remove products based on categories.
   - **User Management:** View and manage user profiles from the admin dashboard.
   - **Order Management:** Confirm orders, manage shipment and payment statuses, and view delivery addresses.
   - **Profile Management:** Admins can also update their profile information through the admin panel.

## Contributors

- [Soumik Maity](https://github.com/S0UMIK07)

## License

## License

This project is licensed under the MIT License. See the [LICENSE](https://opensource.org/licenses/MIT) for details.

## Acknowledgements

- Special thanks to [OpenAI](https://openai.com) for providing tools and resources for AI assistance.
- Acknowledge any libraries, frameworks, or resources used in the project.
- Special thanks to:
  - [YouTube](https://www.youtube.com) for tutorials and educational content.
  - [Stack Overflow](https://stackoverflow.com) for community-driven Q&A.
  - [Geeks for Geeks](https://www.geeksforgeeks.org) for coding tutorials and articles.
  - [JavaTPoint](https://www.javatpoint.com) for Java tutorials and learning resources.

