module tests::matrices @test;
import matrix;
import matrix::mat_type;

import std::math;
import std::math::matrix;

fn void scaled_matrix()
{
	@assert_print(matrix::scaled((double[<2>]){1, 2}), (Matrix3x3){{ 1,0,0,0,2,0,0,0,0 }});
	@assert_print(matrix::scaled((double[<3>]){1, 2, 3}), (Matrix4x4){{ 1,0,0,0,0,2,0,0,0,0,3,0,0,0,0,0 }});
}
fn void translated_matrix()
{
	@assert_print(matrix::translated((double[<2>]){1, 2}), (Matrix3x3){{ 0,0,0,0,0,0,1,2,0 }});
	@assert_print(matrix::translated((double[<3>]){1, 2, 3}), (Matrix4x4){{ 0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,0 }});
}
fn void rotated_matrix_2d()
{
	@assert_print(rounded(matrix::rotated_2d(math::PI / 2)), (Matrix2x2){{ 0, 1, -1, 0 }});
}
fn void rotated_matrix_x()
{
	@assert_print(rounded(matrix::rotated_x(math::PI / 2)), (Matrix3x3){{ 1, 0, 0, 0, 0, 1, 0, -1, 0 }});
}                         
fn void rotated_matrix_y()
{                         
	@assert_print(rounded(matrix::rotated_y(math::PI / 2)), (Matrix3x3){{ 0, 0, -1, 0, 1, 0, 1, 0, 0 }});
}                         
fn void rotated_matrix_z()
{                         
	@assert_print(rounded(matrix::rotated_z(math::PI / 2)), (Matrix3x3){{ 0, 1, 0, -1, 0, 0, 0, 0, 1 }});
}
fn void ortho_matrix()
{
	@assert_print(rounded(matrix::ortho(0, 20, 20, 0, 0.1, 100)), rounded((Matrix4x4){{ 0.100000001, 0, 0, 0, 0, -0.100000001, 0, 0, 0, 0, -0.0200200193, 0, -1, 1, -1.002002, 1 }}));
}
fn void perspective_matrix()
{
	@assert_print(rounded(matrix::perspective(math::PI / 2, 1, 0.1, 100)), rounded((Matrix4x4){{ 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, -1.002002, -1, 0, 0, -0.2002002, 0 }}));
}
fn void look_matrix()
{
	@assert_print(rounded(matrix::look((double[<3>]){ 1, -1, 1 }, (double[<3>]){ 0.140028, 0.700140, 0.700140 }, (double[<3>]){ 0, 1, 0 })), rounded((Matrix4x4){{-0.980580688, -0.137308761, -0.140028015, 0, 0, 0.714005589, -0.700140059, 0, 0.196116135, -0.686543822, -0.700140059, 0, 0.784464538, 1.53785825, 0.140028, 1}}));
}
fn void look_at_matrix()
{
	@assert_print(rounded(matrix::look_at((double[<3>]){ 1, -1, 1 }, (double[<3>]){ 2, 4, 6 }, (double[<3>]){ 0, 1, 0 })), rounded((Matrix4x4){{-0.980580688, -0.137308761, -0.140028015, 0, 0, 0.714005589, -0.700140059, 0, 0.196116135, -0.686543822, -0.700140059, 0, 0.784464538, 1.53785825, 0.140028, 1}}));
}

macro rounded(mat)
{
	foreach (&i : mat.val) *i = math::round(1000000 * *i) / 1000000;
	return mat;
}
