# FIX-PKG-FunctionFieldArithmetic~adv1

Codex, session `codex-kQxhmo`, 2026-10-20; issue #11464. Completed the package fix.
Verdict: **accepted**. The independent review's remaining generalized-Picard/Lang-cover
defect is resolved in README §§4.6–4.10. No second job was claimed.

## Finding dispositions

The input is `reviews/REV-PKG-FunctionFieldArithmetic.md` and its matching handoff;
there is no separate `REV-PKG-FunctionFieldArithmetic~adv.md` in this checkout.
The independent review had already repaired findings 1–10 and 12–23. Their mathematical
statements and Lean declarations are retained. The following accounts for every numbered
finding in that report; only finding 11 required further mathematics.

| Review findings | Disposition |
| --- | --- |
| 1–3: Frobenius, infinity/reduced-basis signs, nonexact-base dimensions, complete Riemann–Roch computation | Existing corrections retained; no change to §§0–1 or their Lean signatures. |
| 4–6: Witt topologies, actual class order, positive-coordinate subgroup, constant terms and one-pole comparison | Existing corrections retained; no change to Layer 3 or its proved examples. |
| 7–10: relative Lubin–Tate, completed Schmid–Witt lifts, clamped upper units, finite ray/coordinate data | Existing corrections retained; §§4.1–4.5 unchanged. |
| 11: generalized Picard construction and Rosenlicht property absent | §4.6 now constructs the representing rigidified Picard schemes by normalized Poincaré bundles and affine descent. It supplies every degree component, tensor/torsor/base-change/forgetful APIs, the unit exact sequence and nonreduced linear part. §4.7 constructs the ray Abel map, proves its high-degree affine-bundle description and deduces the fixed-modulus Rosenlicht universal property. |
| 11: Lang pullback not proved connected or compared with ray classes | §4.8 gives the explicit idele-to-rigidified-line-bundle isomorphism, including the inverse on local units. §4.9 constructs the Lang pullback, computes arithmetic Frobenius as `[v]−deg(v)a`, proves uniformizer idele classes away from any finite set are dense by approximation, and identifies the finite Artin map. Its degree-zero image proves geometric connectedness. |
| 11: constants, quotient surjectivity and least conductor missing | §4.10 pushes out the product of the Lang cover and a constant cover to construct every finite abelian ray torsor. It separates arithmetic/geometric monodromy, identifies the norm kernel, and proves least conductor and modulus descent by local Artin compatibility. The input modulus is not asserted to be least. |
| 12–15: zeta, finite-coefficient determinants, complete place/ray algorithms and degree-sensitive Chebotarev | Existing corrections retained. The dependency sentence in §5.9 now refers to the completed comparison; its algorithm, costs and tests are unchanged. |
| 16–19: adelic models, finite central quotient, weighted constant terms, general reductive reduction and Satake normalization | Existing corrections retained; Layer 6 unchanged. |
| 20–23: sections versus Eisenstein sums, rational Fourier covariance, split Hermitian lengths, interpolation and FYZ degrees | Existing corrections retained; Layer 7 and the four end-to-end arithmetic examples unchanged. |

The summary, ownership, exact contracts, build order, Layer 4 dependencies, downstream
description and references now point to these constructions. Suggested.lean changes only
the closing list of README targets; none of these absent moduli carriers is encoded as
admitted data or replaced by a weaker native-carrier assertion. The kept definitions and
their proved discriminating examples are unchanged. The newer package shape rule places
tests of the new heavy definitions in the README, not in artificial Lean encodings.

## Proof route and ownership

The construction works over any perfect field in §§4.6–4.7. The ray and Lang statements
in §§4.8–4.10 work over every finite exact constant field, every characteristic, every
effective modulus including zero and nonreduced ones, and every finite abelian target
group. There is no rational-point hypothesis on the curve or its open complement.

The finite-field proof uses only finite Artin reciprocity for an extension already
constructed as a Lang torsor, the local compatibility, and the constant-field degree
projection. It does not assume arithmetic existence to establish the Lang cover's
existence or connectedness. In particular:

1. Take the image of the Lang torsor's generic Galois representation, even before
   knowing the torsor is connected, and apply finite Artin reciprocity to its fixed field.
2. Compare on uniformizer ideles using the computed Frobenius, then on all ideles by
   approximation. The explicit map restricts to the identity on the degree-zero ray group.
3. This proves arithmetic monodromy is the full group. Any constant quotient kills the
   degree-zero image, so it is trivial. This proves geometric connectedness.
4. Add finite constant covers, then take finite abelian pushouts. Local unit kernels
   give the least conductor, including tame exponent one and wild exponents.

Ordinary Picard representability and the Picard–Brauer distinction remain in
SchemeAndStackFoundations SF.3c T353–T356; ordinary high-degree Abel maps in SF.3d T359;
coherent pushforward and base change in JacobianChallenge A–C; fpqc module/affine descent
in SF.1 T159–T160; finite-flat affine restriction of scalars in ReductiveGroupsPartII
RG2.0a; Lang for all smooth connected groups in RG2.3.7. ArithmeticGaloisDuality R02.3.2
supplies finite Artin quotients and the degree projection. AL.3 supplies idele topology
and zero-modulus comparison. Only these earlier contracts are used. No higher-rank
Langlands theorem, later GlobalShtukasAndFunctionFieldLanglands input, quantitative
Chebotarev estimate or Tate's-thesis theorem enters the new proof.

Owner-link reconciliation for the maintainer: the accepted packet's
`FA.4/ray-class-and-generalized-picard` and `FA.4/global-abelian-existence` still assign
the nonzero-modulus construction to SF.3 and retain the `GEO-RAY proof boundary`.
Point those construction/comparison inputs to this package's §§4.6–4.10; SF.3 remains
the ordinary Picard supplier. The packet is not an authorized deliverable of this issue
and was not edited. Its other recorded gaps/requests are also unchanged; its checker
result is not a claim that its five historical gaps or 27 requests have been closed.
GlobalShtukasAndFunctionFieldLanglands can consume this ray comparison from here.
No new roadmap or external-file edit is needed for this fix.

## Adversarial pass on touched statements

The table covers each new definition, theorem and promised API, as well as edited
supplier/consumer statements. “Pass” describes the mathematics audit, not formal proof.

| Statement or API | Instances and calculation | Result / correction |
| --- | --- | --- |
| `rigidifiedPicardFunctor`, isomorphisms and pullback | Positive modulus kills every scalar automorphism; at zero modulus this fails and base line bundles must be sheafified away. Real anisotropic conic with degree-two modulus has no degree-one rigidified real bundle. | Pass; separate zero-modulus branch and no rational-point promise. |
| `generalizedPicard`, `generalizedJacobian`, representability | `N=0` gives ordinary Picard and dimension `g`; a rational point modulus gives dimension `g`, not `g−1`. Arbitrary integer degree components, positive characteristic and characteristic zero allowed. | Pass; dimension `g+N−1` restricted to `N>0`. |
| Tensor, dual/unit, torsor, base-change and forgetful APIs | Normalizing at a rational modulus point gives ordinary Picard; forgetting a double point to a single point removes its additive kernel. A degree-two point becomes two points after separable extension. | Pass; maps preserve degree and tensor product, no point needed over the original field. |
| `generalizedJacobian_linearPart` | `ℙ¹`, two simple points: `𝔾_m²/𝔾_m=𝔾_m`; one double point: `(1+bT)(1+cT)=1+(b+c)T mod T²`; one degree-two point gives a torus. | Pass for `p=2`; only successive unipotent quotients are asserted additive. No `N−1` formula at empty modulus. |
| `rayAbel`, symmetric power, base-change and modulus APIs | `n=0` maps to the unit, `n=1` to `O(x)` with canonical rigidification. Two-point rational modulus sends `[c]−[1]` to `c`; double infinity sends `[c]−[0]` to `c`. | Pass; canonical map is to `Pic_m^1`, not to `J_m` without a translation. |
| `rayAbel_affineBundle` | On `ℙ¹`, `N=2,n=1,2` give ranks `0,1`. For an elliptic curve and a single point modulus, degree one misses the class of that point; the stated threshold is two. | Pass; `n≥max(0,2g+N−1)` retained. Affine-line Artin–Schreier covers rule out claiming étale fundamental-group invariance. |
| `HasRayModulus` and base-change/composition/monotonicity | Degree-zero torsor sums are origin independent. `t` on `𝔾_m` has modulus `[0]+[∞]`. On `𝔸¹`, `t` has modulus `2[∞]` but fails `[∞]` on `div((t−1)/t)=[1]−[0]`. | Pass, including characteristic two; quantified geometric congruence relation, not merely support of poles. |
| `rayAbel_rosenlicht` and uniqueness | Zero modulus on `ℙ¹` forces a constant map. The preceding multiplicative and additive maps factor through the computed groups. High-degree fibers are geometrically reduced; descent and translations determine all degrees. | Pass; fixed-modulus universal property over perfect fields; no unsupported claim of constructing a least modulus for every rational map. |
| `rayPicard_comparison`, degree-zero/one and forgetful APIs | `ℙ¹,m=0` gives `ℤ`, kernel zero and singleton degree-one fiber. Nonreduced rational modulus gives degree-zero group of order `q`. Degree-one divisors need not be effective. | Pass; finite-field Brauer obstruction accounted for at zero modulus. |
| `rayPicard_localUnits` | At `[0]+[∞]`, local `λ=2` over `𝔽_5` maps to `λ⁻¹=3`. At `2[∞]`, inverse of `1+bT` is `1−bT`, whose coordinate `−coeff_T` is `b`. | Pass; local boundary inversion recorded explicitly and consistent with the Abel coordinates. |
| `rayLangCover`, equation, torsor, trivial-kernel and forgetful APIs | `A=0` yields identity cover. On `ℙ¹` tame modulus gives `z^(q−1)=t`; at `q=2` this is the identity although `J_m` has dimension one. Wild modulus gives degree-`q` cover `y^q−y=t`. | Pass; uses Lang on smooth connected commutative groups, including unipotent groups. No `q=1` field exists. |
| `rayLangCover_frobenius` | Over `𝔽_5,t=2`, `z^5=2z`, not `3z`; over `𝔽_3,t=1`, `y³=y+1`, not `y−1`. With `a=[1]` and `v=t²+1`, `Frob_9(y)−y=−2=1`, whereas omitting degree gives `2`. | Pass; arithmetic sign and the factor `deg v` pinned by explicit two-term calculations. |
| `ideleClasses_away_dense` | Start with any finite restricted coordinate set, approximate a representative by a principal idele there, remove its divisor outside that set, and leave integral units elsewhere. | Pass; proves density of the stated subgroup, requires no Chebotarev or existence theorem. |
| `rayLangCover_artin`, geometric connectedness | Finite image taken before connectedness; equality on dense uniformizer classes gives the explicit ray projection. Its restriction to `C_m^0` is identity, including trivial `A`. Every constant quotient kills that image. | Pass; separates construction, arithmetic surjectivity and the exact-constant conclusion. |
| `finiteRayLangCover`, map/generic/forgetful/choice APIs | `r=1` allowed when `θ(a)=0`; otherwise `r` must kill that value. Replacing `a` by `a+b` changes the two Frobenius terms by `−dθ(b)` and `+dθ(b)`. | Pass; auxiliary data disappear in the torsor class. Removed an overstrong uniqueness formulation for unpointed isomorphisms, which have deck automorphisms. |
| Classification, norm kernel and open-subgroup realization | Trivial target gives identity; degree mod `r` gives constant degree-`r` field with norm subgroup `deg⁻¹(rℤ)`. Generic finite Artin maps recover every bounded torsor; normality extends generic isomorphisms to `U`. | Pass; finite Artin isomorphism applied to actual extensions, no use of arithmetic existence in the construction. |
| Arithmetic/geometric monodromy and constants | Onto degree character: connected, constant degree `|B|`; onto degree-zero image: geometrically connected. Map `D↦2 deg D` into `ℤ/4` gives two constant quadratic components. | Pass; correct surjectivity and index conditions, including disconnected torsors. |
| Conductor and modulus factorization | Tame Lang cover has conductor `[0]+[∞]` for `q>2`, but zero for `q=2`. Additive Lang cover has conductor `2[∞]` for every `q`, including two. Constant covers have conductor zero. | Pass; least local unit depth, not input multiplicity or Swan alone; characterwise maximum detects all finite abelian inertia. |
| Scope, source contracts, summary, worked Layer 4 example, §5.9 and downstream links | Ordinary versus rigidified Picard separated; affine restriction of scalars includes nonreduced rings; Lang hypothesis is connected smooth, not reductive. The product of the two rational-curve Lang examples has modulus `[0]+2[∞]` with group `𝔾_m×𝔾_a`. New proof stops at earlier suppliers. | Pass; corrected descent owner from SF.0 to SF.1 and scoped the product example to its actual modulus; kept §5.9 arithmetic algorithm unchanged. |
| Suggested file / README agreement | No new Lean carrier or signature; closing target list matches the new README. Existing eight admitted theorems and all proved definition examples retained. | Pass; no generalized-Picard statement is asserted over a weaker surrogate carrier. |

## Source and library audit

Read the reviewed library coverage FA.0–FA.7 and the accepted 48-target packet. Read current
AlgebraicCurves, JacobianChallenge and completed RestrictedProducts roadmaps and Suggested
files, plus the exemplar. Searched the nine newer main roadmaps and current Tau Ceti by
rigidification, generalized Jacobians, Picard and related objects. Native divisor/class
groups are present; the modulus Picard schemes and this Lang comparison were not found.
No upstream mathematics is replanned. Read the exact SF.1/SF.3, RG2.0a/RG2.3.7 and AGD
R02.3.2 contracts, including the latter's prerequisite chain, rather than relying on an
upward citation elsewhere in a supplier package.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, provided Tau Ceti build
`f790474`. Current read-only roadmap main:
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Primary source regions actually inspected:

- Guignard, *On the ramified class field theory of relative curves*, ANT 13 (2019),
  [publisher PDF](https://msp.org/ant/2019/13-6/ant-v13-n6-p03-s.pdf), §4.2–§4.14 and
  proofs, pp. 1316–1321. The new construction uses Proposition 4.8 and the proof of
  Proposition 4.14. SHA-256 `aa6ae6be9d22d4f5a4aab744e22589712d5863f00fad7d33a98f434b186ce94b`.
- Russell, *Albanese varieties with modulus over a perfect field*,
  [arXiv:0902.2533v3](https://arxiv.org/abs/0902.2533v3), Definition 3.11, pp. 27–28,
  and §3.3, Theorems 3.24–3.25, p. 34. Used for the fixed-modulus formulation; its
  1-motive construction is not an imported prerequisite of this proof.
  SHA-256 `d3b0e6330b724b751d6bf33511c027603f612c2151fcbfa15363042bb3ae8c4d`.
- Conrad, *Geometric global class field theory*,
  [handout](https://math.stanford.edu/~conrad/249BW09Page/handouts/geomcft.pdf), all four
  pages, especially §2 and Theorems 3.1–3.2. Its classification is the comparison target;
  its statement is not substituted for a proof. SHA-256
  `d5a83bd35472904dabd0d8ff02974b221065af2ebbc421d12a45bb3e3da16a85`.
- Milne ADT, [author PDF](https://www.jmilne.org/math/Books/ADTnot.pdf), Appendix A,
  A.7–A.13 and proofs, pp. 131–137: Brauer sequence, finite-field class formation,
  principal-idelic reciprocity, finite norm quotients and the distinction from the
  reduced group over other quasi-finite fields. The new citation specifically includes
  A.8–A.12; A.7 by itself is a Brauer sequence, not the finite Artin isomorphism.

Also investigated Takeuchi, *Blow-ups and class field theory for curves*, §§2–4 and
proofs, pp. 1328–1350, and Stacks purity/projective-bundle leads. That approach needs
refined Swan theory and compactified symmetric powers. None of those results is an
undeclared prerequisite here: the final finite-field proof uses the existing finite
Artin supplier and approximation instead. No private source files or passages were copied.

## Validation

- `lean-check research/blueprint/packages/FunctionFieldArithmetic/Suggested.lean`: exit 0;
  eight `declaration uses sorry` warnings, no other warnings or errors. Available memory
  was 80 GB before the single check. Used only the supplied pinned build; no language
  server, build, update or cache command. Subsequent Lean edits only added names inside
  the existing closing comment.
- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmetic.json`:
  zero errors and warnings, 48 nodes; packet unchanged.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: zero problems.
- `git diff --check`: clean. Review JSON parses; metadata unchanged. Only the four
  authorized deliverables are submitted.

Elaboration checks the existing signatures, not the mathematical truth of the new README
targets. The proof sketches, concrete Checks and pass table are the mathematics audit.
There is no unfinished package finding or required handoff work for another worker.

## Untrusted-input note

The inherited author's handoff assertion that the maintainer prohibited computational
certificates was already rejected by the independent review. I continued to treat it as
untrusted commentary and preserved all certified computation targets. No commands,
credential actions or out-of-scope edits were performed on instructions from source
pages or other authors' text. Fetched sources were read as data only.
