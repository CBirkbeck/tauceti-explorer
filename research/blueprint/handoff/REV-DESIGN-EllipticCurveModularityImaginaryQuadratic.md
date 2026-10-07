# Handoff: REV-DESIGN-EllipticCurveModularityImaginaryQuadratic

Refs #6905. ChatGPT Pro, session `chatgpt-20261007-c7a942`, 7 October 2026.

**Partial independent-review checkpoint.** The [report](../reviews/REV-DESIGN-EllipticCurveModularityImaginaryQuadratic.md) contains the established findings and their proofs. Neither the report nor this handoff is an acceptance. This submission changes only these two Markdown files. The live definition, packet, reader, suggested Lean file and their review metadata are unchanged.

## Exact input identifiers

- Packet: `c065d00784447d1bfe4df873ed7cb6ca17ffc5c0`.
- Reader: `d9a74a3d028165501a2910aa7149b9c98cd4cc7e`.
- Suggested Lean: `30e853defd7e3c7db97239034327a3cda968cff5`.

The input files were read through the connector on the job branch. These are returned Git blob identifiers, not independently reconstructed local hashes. Check current inputs before applying the corrections.

## Resume and apply

Reclaim the issue normally after checkpoint intake releases it. Read current WORKERS, PROTOCOL and the issue first. Then apply the following in the packet and synchronize the reader and the actual withheld-contract comments in the suggested file.

**F1 — switching outputs and non-CM witness.** Strengthen the output of `IQ.2/switch-five` by retaining Tate reduction above 2 and 3, and that of `IQ.2/switch-three` by retaining Tate reduction above 5. Say explicitly that the output A is non-CM. In the mod-3 selection/proof replace the good-ordinary-or-Tate alternative at 5 by this Tate choice; the prescribed 3-adic partition remains unchanged. In `auxiliary-local-types`, delete the branch that claims CM of A settles modularity of E. Derive A's non-CM property from the Tate place and the CM potentially-good-reduction input; make the latter supplier explicit. The source locators and exact distinction are in the report.

**F2 — conditional extension assertion.** In `IQ.3/elliptic-lifting-data`, keep the determinant, ramification and local Hodge–Tate conclusions unconditional. Introduce residual decomposed genericity and a fixed rational-prime witness before the witness-preserving solvable-extension assertion. Keep the finite Galois avoidance field visible. Its `cm-modularity` consumer already provides genericity; do not turn a source-preserving step into an unexplained existence of a witness.

**F3 — quotient-level Fricke comparison.** Replace the genus-one modularity statement's `σP=w5P` by the relation of their images in `X(ns3,b5)` under the specified Fricke involution on that quotient. Replace proof step 3 accordingly. The equation x(P)x(σP)=5 supplies this quotient relation; the modular interpretation then gives the geometric 5-isogeny. Do not silently choose one of the two possible lifts to the quartic. No new lift theorem is needed for the existing modularity goal.

**F4 — rational versus exact-quadratic points.** Replace the genus-two modularity node's rational-x/infinity branch by: rational P, including infinity, has rational j and uses the existing rational-j modularity input; a nonrational affine P with rational x has exact degree two and satisfies σP=w3P. Preserve the exceptional imaginary orbit and the separate real-quadratic FLHS branch. Add the rational infinity points as a discriminating acceptance test: σ fixes each, w3 exchanges them. The actual sextic has leading coefficient 9 and infinity values ±3; do not replace it by a different model.

The source issue below is proposed for the packet. It has **not** been registered by this checkpoint. Existing sourceIssues E4, E5, E9, E17, E18 and E19 and their provenance must remain intact. Preserve the existing sourceVersions; do not claim the designer's PDF hash as a fresh download verification.

```json
{
  "id": "EllipticCurveModularityImaginaryQuadratic/E20",
  "source": "CN",
  "kind": "error",
  "locator": "Corollary 7.3.4 proof, printed p.98, arXiv:2301.10509v3 (27 March 2025); read with Proposition 7.3.1 on p.97. Both page images inspected 2026-10-07.",
  "printed": "(and the points at infinity) have σ(P) = w₃(P).",
  "correction": "Handle rational points, including both infinity points, through rational j. Use σ(P)=w₃(P) only for nonrational affine points of exact degree two with rational x-coordinate.",
  "reason": "For f(x)=9x^6−6x^5−35x^4+40x^2+12x−8, the infinity chart t=1/x, v=y/x^3 has v^2=9−6t−35t^2+40t^4+12t^5−8t^6. Its smooth infinity points (0,3),(0,−3) are Q-rational. Galois fixes each, whereas w3 sends v to −v. Thus the asserted equality fails there; the rational-j branch repairs the proof without changing its endpoint.",
  "affects": "the proof",
  "known": "new",
  "searched": [
    "2026-10-07: arXiv 2301.10509 version history and v3 were checked.",
    "2026-10-07: James Newton's public publications page was checked for the paper and a correction link.",
    "2026-10-07: targeted queries for the arXiv identifier with erratum/corrigendum and the corollary number did not identify a correction. This is not an exhaustive novelty claim."
  ],
  "review": {
    "verdict": "confirmed",
    "reason": "The preprint's rendered display and the rational infinity-chart calculation give the contradiction. The corrected argument separates rational points from exact-degree-two points. This finding is scoped to the preprint, not a verified version of record.",
    "by": "REV-DESIGN-EllipticCurveModularityImaginaryQuadratic"
  }
}
```

A source-issue verdict takes effect only through the completed review workflow. Do not mark the overall review accepted merely by adding this record.

## Remaining full review

Complete the fifteen-declaration pinned baseline audit and reviewed library-coverage audit. Finish every node's source/proof/API assessment, the cross-roadmap supplier statements and ownership, all source-issue verdicts and route coverage. In particular, read the crystalline-lifting sibling as it now exists rather than inheriting a stale claim that its blueprint is unwritten. IQ.7's actual genus-three quartics, projective involutions, Jacobian/torsion data and finite symmetric-power sieve need their own direct source check. Do not infer their correctness from the genus-one/genus-two calculations below.

Run `scripts/check_blueprint.py` on the actual edited packet before a completed submission. It was **not run in this checkpoint**. No matching existing Lean build was available, so Lean was not compiled and no dependency build, cache download or language server was started. The existing signatures and omissions remain unverified as a whole. The report distinguishes the few pinned Weierstrass definitions read from the uncompleted baseline audit.

## Exact regression program actually run

The following SymPy program reproduces the 40 passing arithmetic assertions. It needs no internet, Magma or Lean. Run in the worker's scratch space. These tests do not certify rank, saturation, modular identifications, exhaustive quadratic points or any modularity theorem. The polynomial factors are explicit and checked, not presumed.

```python
import sympy as s

x, t, a = s.symbols('x t a')
checked = []

def check(name, condition):
    if not bool(condition):
        raise AssertionError(name)
    checked.append(name)

def reduce_a(expr, modulus):
    return s.rem(s.Poly(s.expand(expr), a, domain=s.QQ),
                 s.Poly(modulus, a, domain=s.QQ)).as_expr()

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
print(f'{len(checked)} exact arithmetic checks passed')
```

No inaccessible scratch file is needed to resume. The next worker must apply the corrections and complete the audit; this checkpoint deliberately leaves the live review verdict unchanged.
