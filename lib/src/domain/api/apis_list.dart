//website domain
const domain = "https://dev-api-gateway.mavenx.gg/";


// < ---------------------  AUTHENTICATION APIS --------------------- >
const accRegisterApi = "${domain}api/account/register";
const accLoginApi = "${domain}api/account/login";
const sendEmailVerificationCodeApi = "${domain}api/account/send/verificationEmail";
const verifyOTPCodeApi = "${domain}api/account/verifyOTPForForgotPassOrEmailVerification";
const updateBirthdayApi = "${domain}api/account/onboarding/updateBirthday";
const searchFavortieGameApi = "${domain}api/games/getActiveLookUpGamesForOnBoardingProcess/1/50?searchByGameName=";
const updateFavortieGameApi = "${domain}api/account/onboarding/updateFavoriteGames";
const searchFavortiePersonApi = "${domain}api/channel/getUserChannelsToFollowForOnBoardingProcess?userNameToSearch";
const updateFavoritePersonApi = "${domain}api/account/onboarding/updateFollowingUsers";
const updateUserBioApi = "${domain}api/account/onboarding/updateBio";
const lastStepVerifyDetailsApi = "${domain}api/account/onboarding/verifyDetails";


// < ---------------------  USER APIS --------------------- >
const getCurrentUserDetailsApi = "${domain}api/account/getCurrentUserDetails";
const getUserChannelDetailsApi = "${domain}api/channel/getUserChannelByUserGuidId";
const getUserFavoriteGamesDetailApi = "${domain}api/games/getUserFavouriteGamesByUserGuid";
const getUserChannelFollowingDetailApi = "${domain}api/channel/getUserChannelFollowing";


// < ---------------------  DASHBOARSFD APIS --------------------- >
const getTopGamesDashboarApi = "${domain}api/channel/getTopGamesForDashboard?tag=&pageNo=1&pageSize=50";
const getTopStreamDashboarApi = "${domain}api/channel/getTopChannelsBasedOnDuration";
const getTopStreamOnUserPreferenceDashboarApi = "${domain}api/channel/getTopChannelsBasedOnUserPrefrence";


// < ---------------------  STREAMING APIS --------------------- >
const getStreamingVideoApi = "${domain}api/channel/getStreamingURLByUserName";
const getStreamingVideoDetailApi = "${domain}api/channel/getStreamingDetailsByUserName";
const getStreamingVideoChatApi = "${domain}api/chat/pagedStreamingChats";
