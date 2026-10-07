# Handoff: REV-DESIGN-EllipticCurveModularityImaginaryQuadratic

Refs #6905. Codex, session `codex-BaAQGd`, 7 October 2026.

**Completed independent review; accepted planning pass.** This replaces the earlier partial checkpoint. All 68 nodes are assessed in the [report](../reviews/REV-DESIGN-EllipticCurveModularityImaginaryQuadratic.md) and packet review object: 54 verified, 14 corrected, no added/deleted nodes. All fifteen baseline references are confirmed; 69 API entries and 69 unit tests cover all 23 definition/construction nodes. The roadmap, packet, reader and complete suggested ledger are synchronized. Seven source issues are independently confirmed, including the newly registered preprint-scoped E20.

F1–F4 are applied: retained Tate places export non-CM auxiliaries; witness-preserving preparation has its explicit residual genericity input; the genus-one argument uses Fricke on the quotient; rational genus-two points, including infinity, use rational j. The actual qualified CL.9 lifting node is imported, and stronger enormous-image prerequisites are removed from the arbitrary residual-data route. The report records all other notation, source-locator and dependency fixes.

The review task is finished. There is no unfinished review step for the next worker to resume. **Eight stages remain planned, zero closed, sixteen implementation/certificate gaps remain, all implementations unchecked.** The report's orchestrator questions route the general owner extensions and missing sibling/certificates. Do not close those gaps on the strength of these checks.

## Reproducibility and validation

The packet and reader retain the exact PDF URLs/SHA-256 values and author-script commit/hashes. Six source PDFs and five scripts were freshly fetched and hash matched. Scripts and external packages were read where available, not executed. Kwon/DGP originals and the √−11 database pages were not independently obtained; the associated gaps remain. Source findings concern CN arXiv v3, not a verified version of record. No inaccessible scratch file is needed to identify the inputs.

Checks completed:

- Final blueprint checker: 0 errors, 0 warnings.
- Seven-record errata projection: ok.
- All 68 node contracts, proof sketches, hypotheses, dependencies, acceptance conditions and API/tests agree across packet/reader/Lean ledger; all eight stage dependency sets agree.
- Exact arithmetic program below: 68 assertions passed under SymPy 1.14.0 (mpmath 1.3.0).
- Final `lean-check research/blueprint/suggested/EllipticCurveModularityImaginaryQuadratic.lean`: exit 0 with only `sorry` warnings.
- Executable Lean expressions are unchanged by this review; the full comment ledger was synchronized and then elaborated again to check the final file.

The existing shared build has Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` exactly, but Tau Ceti `cf386627e9176a3827c1a5fe804989fd94a4d216` rather than the declared `f790474821cf4256814db967cb154e7af3d0c369`. Because the suggested file imports only Mathlib, the elaboration claim covers its existing algebraic carriers/signatures, not absent or differently pinned Tau Ceti suppliers. All missing full signatures remain explicit contracts in comments.

To repeat the errata check, construct a scratch JSON named `EllipticCurveModularityImaginaryQuadratic.json` containing `roadmapId`, `sourceIssues`, and `sourceVersions` copied from the packet, with `protocol` set to `errata-v1`; run `python3 scripts/check_errata.py` on that scratch file. The errata checker does not accept blueprint-v1 input directly.

## Exact arithmetic program

Save this block as a Python file in scratch and run with SymPy 1.14.0 available. It performs exact polynomial/field calculations, not numerical approximations. It does not certify exhaustive points, Jacobian group orders, ranks, saturation, residual images, modular model dictionaries or sieves. In particular, both possible genus-one lifts are tested without claiming which one is the modular Fricke lift.

```python
import sympy as s

x, t, a = s.symbols('x t a')
checked = []

def check(name, condition):
    if not bool(condition):
        raise AssertionError(name)
    checked.append(name)

def reduce_a(expr, modulus):
    return s.rem(s.Poly(s.expand(expr), a, domain=s.EX),
                 s.Poly(modulus, a, domain=s.EX)).as_expr()

f = 9*x**6 - 6*x**5 - 35*x**4 + 40*x**2 + 12*x - 8
check('genus_two_degree', s.degree(f, x) == 6)
check('genus_two_leading_coefficient', s.Poly(f, x).LC() == 9)
check('genus_two_squarefree', s.degree(s.gcd(f, s.diff(f, x)), x) == 0)
check('genus_two_factorization',
      s.expand((x+1)*(3*x-1)*(x-2)*(3*x**3+2*x**2-4*x-4)-f) == 0)
for r in [-1, s.Rational(1, 3), 2]:
    check('genus_two_root_' + str(r), f.subs(x, r) == 0)

g = s.expand(t**6 * f.subs(x, 1/t))
check('infinity_chart_constant', g.subs(t, 0) == 9)
for v in [3, -3]:
    check('infinity_point_' + str(v), v*v == g.subs(t, 0))
    check('infinity_smooth_' + str(v), 2*v != 0)
    check('infinity_flip_not_fixed_' + str(v), v != -v)
for sign in [1, -1]:
    xx, yy = (-5+a)/6, sign*(17-a)/6
    check('minus_eleven_point_' + str(sign),
          reduce_a(yy**2-f.subs(x, xx), a*a+11) == 0)

h = -3*(x**4+2*x**3-x**2+10*x+25)
check('genus_one_reciprocal', s.cancel(x**4*h.subs(x, 5/x)-25*h) == 0)
xx, yy = 1+2*s.I, 3+6*s.I
check('genus_one_gaussian_point', s.simplify(yy**2-h.subs(x, xx)) == 0)
check('gaussian_x_norm_five', s.expand(xx*s.conjugate(xx)) == 5)
check('gaussian_plus_lift_conjugates',
      s.simplify(5*yy/xx**2-s.conjugate(yy)) == 0)
check('gaussian_minus_lift_not_conjugate',
      s.simplify(-5*yy/xx**2-s.conjugate(yy)) != 0)

functions = {
    'b3': ((x+27)*(x+3)**3, x),
    'b5': ((x*x+250*x+3125)**3, x**5),
    'ns3': (x**3, 1),
    'ns5': (125*x*(2*x+1)**3*(2*x*x+7*x+8)**3, (x*x+x-1)**5),
    's3': (27*(x+1)**3*(x-3)**3, x**3),
}
expected_degrees = {'b3': 4, 'b5': 6, 'ns3': 3, 'ns5': 10, 's3': 6}
for name, (num, den) in functions.items():
    check(name+'_coprime', s.degree(s.gcd(num, den), x) == 0)
    check(name+'_map_degree',
          max(s.degree(num, x), s.degree(den, x)) == expected_degrees[name])
check('b3_at_one', functions['b3'][0].subs(x, 1) == 1792)
check('b5_at_one', functions['b5'][0].subs(x, 1) == 38477541376)
check('b5_at_minus_five',
      s.cancel(functions['b5'][0]/functions['b5'][1]).subs(x, -5) == -2194880)
check('ns5_at_infinity',
      s.LC(s.Poly(functions['ns5'][0], x)) /
      s.LC(s.Poly(functions['ns5'][1], x)) == 8000)
check('s3_at_one',
      s.cancel(functions['s3'][0]/functions['s3'][1]).subs(x, 1) == -1728)

def invariants(coefficients):
    a1, a2, a3, a4, a6 = map(s.sympify, coefficients)
    b2, b4, b6 = a1*a1+4*a2, 2*a4+a1*a3, a3*a3+4*a6
    b8 = a1*a1*a6+4*a2*a6-a1*a3*a4+a2*a3*a3-a4*a4
    c4 = b2*b2-24*b4
    delta = -b2*b2*b8-8*b4**3-27*b6**2+9*b2*b4*b6
    return s.expand(delta), s.cancel(c4**3/delta)

delta, j = invariants([0, 0, -1, 0, 1])
check('B_discriminant', delta == -675)
check('B_j', j == 0)
delta, _ = invariants([0, 41, 0, 400, 0])
check('E15_discriminant', delta == 207360000)
delta, _ = invariants([0, 17, 0, 16, 0])
check('Es35_discriminant', delta == 921600)
assert len(checked) == 40
# Independently checked quartic, local-chart and model regressions.
X,Y,Z,alpha = s.symbols('X Y Z alpha')
q1=9*X**4+19*X**2*Y**2+Y**4+9*X**3*Z+19*X**2*Y*Z+22*X*Y**2*Z+2*Y**3*Z+10*X**2*Z**2+22*X*Y*Z**2+13*Y**2*Z**2+7*X*Z**3+12*Y*Z**3+11*Z**4
q2=-X**4+2*X**3*Y+X**2*Y**2+8*X**3*Z+2*X**2*Y*Z-2*X*Y**2*Z-Y**3*Z-3*X**2*Z**2-3*X*Y*Z**2+3*Y**2*Z**2+2*X*Z**3-3*Y*Z**3+Z**4
for idx,(q,M,k) in enumerate([(q1,s.Matrix([[1,0,0],[0,-1,-1],[0,0,1]]),1),(q2,s.Matrix([[3,1,2],[8,1,-8],[4,-2,1]]),25)],1):
    check('quartic_'+str(idx)+'_homogeneous', all(sum(m)==4 for m in s.Poly(q,X,Y,Z).monoms()))
    check('involution_'+str(idx)+'_square',M*M==k*s.eye(3))
    vv=M*s.Matrix([X,Y,Z])
    check('quartic_'+str(idx)+'_invariant',s.expand(q.subs(dict(zip([X,Y,Z],vv)), simultaneous=True)-k**2*q)==0)
    check('involution_'+str(idx)+'_invertible',M.det()!=0)
for idx,(xx,yy) in enumerate([((1+a)/28,(27-a)/56),((3-a)/4,(3+3*a)/4)],1):
    check('minus_fifty_five_point_'+str(idx),reduce_a(q2.subs({X:xx,Y:yy,Z:1}),a*a+55)==0)
for tag,poly,yy in [('Pl1',x*x-5*x+1,1-2*x),('Pl2',x*x+x-1,3-3*x)]:
    check(tag+'_quartic_support',s.rem(s.Poly(q2.subs({X:x,Y:yy,Z:1}),x),s.Poly(poly,x)).is_zero)
    check(tag+'_irreducible',not s.polys.polytools.intervals(poly,eps=s.Rational(1,100))==[] and not s.sqrt(s.discriminant(poly,x)).is_rational)
for xx,yy,zz in [(0,1,1),(-3,7,1),(0,1,0),(s.Rational(-1,2),s.Rational(-1,2),1)]:
    check('torsion_support_'+str((xx,yy,zz)),q2.subs({X:xx,Y:yy,Z:zz})==0)
# Exact Gaussian and -11 Weierstrass invariants (no arithmetic-image inference).
delta,j=invariants([s.I,1,1,6+s.I,10-15*s.I])
check('gaussian_delta',s.expand(delta)==58752+107136*s.I)
check('gaussian_j',s.simplify(j-(-47709+15363*s.I)/256)==0)
delta,j=invariants([a,0,1+a,-24-6*a,56+13*a])
check('eleven_delta',reduce_a(delta-(4512-736*a),a*a-a+3)==0)
num,den=s.fraction(s.together(j-(11155375*a+3126750)/32))
check('eleven_j',reduce_a(num,a*a-a+3)==0 and reduce_a(den,a*a-a+3)!=0)
# Mixed elliptic dense-open identity: source U,V,W land on B after x^3=ns5(t).
A=t*t+t-1;D=(2*t+1)*(2*t*t+7*t+8);U=-x*A*A/5;V=D;W=t*D
lhs=s.expand(V*V*W-V*W*W-U**3-W**3)
check('mixed_map_identity',s.cancel(lhs.subs(x**3,125*t*D**3/A**5))==0)
# Corrected Riemann--Roch fibers. Reduce s^2=-3 using variable a.
for idx,(shift,sign,c0) in enumerate([(0,1,30-10*a*alpha),(2,-1,2*alpha**2+10*a*alpha),(s.Rational(5,2),-1,s.Rational(5,2)*alpha**2+10*a*alpha)]):
    yy=alpha*(x+shift)-a*(x*x+sign*5)
    fiber=(6-2*a*alpha)*x*x+(alpha**2+[-33,15,12][idx])*x+c0
    check('corrected_RR_fiber_'+str(idx),reduce_a(s.expand(yy*yy-h-(x+shift)*fiber),a*a+3)==0)
check('E0_conic_rational_point',3**2+3*2**2+6*2-33==0)
check('minus_ten_point', (6*a)**2-(-1)*(-1+16)*(-1+25)==36*(a*a+10))
print(f'{len(checked)} exact arithmetic checks passed')
```

No Magma replay or full arithmetic certificate is implied. Once intake has accepted this review, future implementation work should begin from the precisely enumerated G1–G16 supplier/certificate outputs in the packet and report, rather than from the former partial checkpoint's resume instructions.
