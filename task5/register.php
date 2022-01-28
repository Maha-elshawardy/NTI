<?php
$title = "Register";
include_once "layouts/header.php";
include_once "app/middleware/guest.php";
include_once "layouts/nav.php";
include_once "layouts/breadcrumb.php";
include_once "app/requests/Validation.php";
include_once "app/models/User.php";
include_once "app/services/mail.php";


if ($_POST) {
    // print_r($_POST);die;
    $success = [];
    // validation rules
    // first_name=>required,string
    $firstNameValidation = new Validation('first_name', $_POST['first_name']);
    $firstNameRequiredResult = $firstNameValidation->required();
    $firstNamePattern = "/^([a-zA-Z' ]+)$/";
    if (empty($firstNameRequiredResult)) {
        $firstNameRegexResult = $firstNameValidation->regex($firstNamePattern);
    }
    // last_name=>required,string
    $lastNameValidation = new Validation('last_name', $_POST['last_name']);
    $lastNameRequiredResult = $lastNameValidation->required();
    $lastNamePattern = "/^([a-zA-Z' ]+)$/";
    if (empty($lastNameRequiredResult)) {
        $lastNameRegexResult = $lastNameValidation->regex($lastNamePattern);
    }
    // gender=>required,['f','m']
    // email =>required
    $emailValidation = new Validation('email', $_POST['email']);
    $emailRequiredResult = $emailValidation->required();
    $emailPattern = "/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/";
    if (empty($emailRequiredResult)) {
        $emailRegexResult = $emailValidation->regex($emailPattern); //regularexp(pattern)
        if (empty($emailRegexResult)) {
            $emailUniqueResult = $emailValidation->unique('users'); //unique
            if (empty($emailUniqueResult)) {
                $success['email'] = 'email';
            }
        }
    }
    // phone => required , regex(pattern) , unique
    $phoneValidation = new Validation('phone', $_POST['phone']);
    $phoneRequiredResult = $phoneValidation->required();
    $patternRegularPhone = "/^01[0125][0-9]{8}$/";
    if (empty($phoneRequiredResult)) {
        $phoneRegexResult = $phoneValidation->regex($patternRegularPhone);
        if (empty($phoneRegexResult)) {
            $phoneUniqueResult = $phoneValidation->unique('users');
            if (empty($phoneUniqueResult)) {
                $success['phone'] = 'phone';
            }
        }
    }
    // password => required , regex(pattern) , = passwrod_confirmation
    $passwordValidation = new Validation('password', $_POST['password']);
    $passwordRecuiredResult = $passwordValidation->required();
    $patternRegularPassword = "/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/";
    if (empty($passwordRecuiredResult)) {
        $passwordRegexResult = $passwordValidation->regex($patternRegularPassword);
        if (empty($passwordRegexResult)) {
            $passwordConfirmationResult = $passwordValidation->confirmed($_POST['password_confirmation']);
            if (empty($passwordConfirmationResult)) {
                $success['password'] = 'password';
            }
        }
    }
    if(isset($success['password']) && isset($success['email']) && isset($success['phone'])) {
        // insert user

        $userObject = new User;
        $userObject->setFirst_name($_POST['first_name']);
        $userObject->setLast_name($_POST['last_name']);
        $userObject->setEmail($_POST['email']);
        $userObject->setPhone($_POST['phone']);
        $userObject->setPassword($_POST['password']);
        $userObject->setGender($_POST['gender']);
        $code = rand(10000,99999);
        $userObject->setCode($code);
        $result = $userObject->create();
        
        if($result){
            $subject = "verifcation Code";
            $body = "Hello {$_POST['first_name']} {$_POST['last_name']} <br> your verification code is:<br>$code</br> thank you.";
            $mail = new mail($_POST['email'],$subject,$body);
            $mailResult = $mail->send();
            if($mailResult){
                $_SESSION['email'] = $_POST['email'];
                header('location:check-code.php');die;
            }else{
                $error = "<div class='alert alert-danger'> Try Again Later </div>";
            }


            
        }else{
            $error = "<div class='alert alert-danger'> Try Again Later </div>";
        }
    }
}
?>
<div class="login-register-area ptb-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                <div class="login-register-wrapper">
                    <div class="login-register-tab-list nav">
                        </a>
                        <a class="active" data-toggle="tab" href="#lg2">
                            <h4> register </h4>
                        </a>
                    </div>
                    <div class="tab-content">
                        <div id="lg2" class="tab-pane active">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <?php if (isset($error)) {
                                        echo $error;
                                    } ?>
                                    <form action="#" method="post">
                                        <input type="text" name="first_name" placeholder="First name" value="<?php if (isset($_POST['first_name'])) {
                                                                                                                    echo $_POST['first_name'];
                                                                                                                } ?>">

                                        <!-- start print email errors  -->
                                        <?= empty($firstNameRequiredResult) ? "" : "<div class='alert alert-danger'>$firstNameRequiredResult</div>"; ?>
                                        <?= empty($firstNameRegexResult) ? "" : "<div class='alert alert-danger'>$firstNameRegexResult</div>"; ?>
                                        <!-- end print email error -->

                                        <input type="text" name="last_name" placeholder="Last name" value="<?php if (isset($_POST['last_name'])) {
                                                                                                                echo $_POST['last_name'];
                                                                                                            } ?>">

                                        <!-- start print email errors  -->
                                        <?= empty($lastNameRequiredResult) ? "" : "<div class='alert alert-danger'>$lastNameRequiredResult</div>"; ?>
                                        <?= empty($lastNameRegexResult) ? "" : "<div class='alert alert-danger'>$lastNameRegexResult</div>"; ?>
                                        <!-- end print email error -->

                                        <input name="email" placeholder="Email" type="email" value="<?php if (isset($_POST['email'])) {
                                                                                                        echo $_POST['email'];
                                                                                                    } ?>">

                                        <!-- start print email errors  -->
                                        <?= empty($emailRequiredResult) ? "" : "<div class='alert alert-danger'>$emailRequiredResult</div>"; ?>
                                        <?= empty($emailRegexResult) ? "" : "<div class='alert alert-danger'>$emailRegexResult</div>"; ?>
                                        <?= empty($uniqueEmail) ? "" : "<div class='alert alert-danger'>$uniqueEmail</div>"; ?>
                                        <!-- end print email error -->
                                        <input name="phone" placeholder="Phone number" type="number" value="<?php if (isset($_POST['phone'])) {
                                                                                                                echo $_POST['phone'];
                                                                                                            } ?>">

                                        <!-- start print phone errors  -->
                                        <?= empty($phoneRequiredResult) ? "" : "<div class='alert alert-danger'>$phoneRequiredResult</div>"; ?>
                                        <?= empty($phoneRegexResult) ? "" : "<div class='alert alert-danger'>$phoneRegexResult</div>"; ?>
                                        <?= empty($phoneUniqueResult) ? "" : "<div class='alert alert-danger'>$phoneUniqueResult</div>"; ?>
                                        <!-- end print phone error -->

                                        <input type="password" type="password" name="password" placeholder="Password">
                                        <?= empty($passwordRequiredResult) ? "" : "<div class='alert alert-danger'>$passwordRequiredResult</div>"; ?>
                                        <?= empty($passwordRegexResult) ? "" : "<div class='alert alert-danger'>Minimum eight and maximum 15 characters, at least one uppercase letter, one lowercase letter, one number and one special character</div>"; ?>
                                        <input type="password" name="password_confirmation" placeholder="Confrim Password">
                                        <?= empty($passwordConfirmationResult) ? "" : "<div class='alert alert-danger'>$passwordConfirmationResult</div>"; ?>

                                        <select name="gender" class="form-control" style="margin-bottom: 20px;">
                                            <option <?= (isset($_POST['gender']) && $_POST['gender'] == 'm') ? 'selected' : '' ?> value="m">Male</option>
                                            <option <?= (isset($_POST['gender']) && $_POST['gender'] == 'f') ? 'selected' : '' ?> value="f">Female</option>
                                        </select>
                                        <div class="button-box">
                                            <button type="submit"><span>Register</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
include_once "layouts/footer.php";
include_once "layouts/footer-script.php";
?>