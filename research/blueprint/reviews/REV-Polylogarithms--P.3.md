# Independent review: Polylogarithms, P.3

**Needs changes.** Codex (GPT-6), session `codex-ThUx40`, reviewed issue #6403 on
2026-10-06 independently of author session `codex-mZTIGY`. The review pass is
complete. This is not a checkpoint. Implementation statuses remain `unchecked`.

The packet's target-level mathematics has substantial primary support, and its
open proof gaps are often appropriately explicit. Acceptance is prevented by
unfaithful suggested signatures, missing discriminating coverage, and unresolved
normalization adapters. The original positive top-map coefficient also fails an
exact nonzero rational test; it is corrected here. The alleged page 298 source
misprint is rejected.

## Scope, counts and verdict

I read the complete part reader, packet, suggested file and author handoff; all
inherited P.3 target contracts; the precise external supplier nodes; WORKERS,
both protocols, the upstream guide and the HodgeStructures and AlgebraicTopology
upstream examples. I checked the reviewed P.3 library audit (AUDIT-30), which
marks the five atlas targets unbuilt and identifies existing linear algebra.
No target is already built, and no new library foundation is planned here.

| Item | Original → reviewed result |
|---|---|
| Local nodes | 27 retained: 10 constructions, two definitions, 13 theorems, two comparisons |
| Node verdicts | Four verified, eight corrected, 15 unverifiable; none added |
| API items in packet | 68 retained; real suggested signatures 51 → 41 |
| Unit tests in packet | 36 → 37; real suggested examples 34 → 28 |
| Named theorem/comparison signatures | Seven → zero of the 15 packet names; omitted names explicitly documented |
| Baselines | All 25 original citations confirmed; one declaration-kind correction; one helper citation added; none removed |
| Source findings | Four → five: E-P3-01 rejected; E-P3-02/03/04 confirmed; E-P3-05 added and confirmed |
| Gaps / requests | Six → eight gaps; five supplier requests retained and sharpened |
| Coverage | One stage planned, zero closed; complete planning pass retained |
| Planets | Two new, plus the two inherited P.3 planets: within the six-per-layer limit |

`complete` records a finished planning pass, not closure or acceptance. All five
atlas targets and the inherited packet contracts are represented. The explicit
remaining list names the unresolved chains; no stage is marked closed. A revision
can preserve this scope and target granularity. It does not need lemma splitting.

## Corrections made in place

1. Changed `r₆` to **−(1/5) Alt₆[T]₃** under the packet's fixed differential and
   deletion conventions. Updated its API, normalization test and chain-map proof
   recipe; added a nonzero raw rational valuation test. The magnitude 1/5 and
   sign are separate checks. Corrected `r₄=−3 Alt₄` was already in the author
   packet and is independently confirmed.
2. Added reviews to all four original source findings. Rejected the proposed
   p. 298 correction and made the degree-two test agree with that published
   display. Added E-P3-05 with a reproducible witness below.
3. Corrected GR v5's date from 2025 to **15 July 2026**. As of the review date,
   [arXiv's record](https://arxiv.org/abs/1803.08585) and the
   [Annals forthcoming list](https://annals.math.princeton.edu/toappear) give
   no accessible version of record. The GR coefficient findings concern v5.
4. Split seven conflated source entries into their real source IDs, corrected
   the generic-vector definition to G95 p. 255, the symmetrized resolution to
   §2.6, Proposition 3.7 to p. 266, the L₃ definition to (1.3)–(1.4), and the
   coordinate (1.17) locator to p. 208. The p. 210 specialization is unnumbered;
   Theorem 1.1 has no part (a). Separated inherited suppliers from literal source
   locators. Recorded independent reading without erasing author read lists.
5. Changed the baseline kind of `NumberField.discr` from `def` to `abbrev`.
   Added the pinned `padicValRat` citation for the raw coordinate test.
6. Removed three parent conclusions from the proof inputs they were meant to
   support: rank-two vanishing no longer imports the parent K comparison;
   Steinberg image no longer imports the parent Milnor comparison; calibration
   no longer imports the parent regulator comparison. This prevents circular
   assembly proof routes; it is not a claim that the local JSON checker detected
   an existing cycle.
7. Removed `P.5/residue-map` from the conditional complex transfer: that supplier
   only gives exterior residues on a normal complex variety. Sharpened the P.4
   request to actual weight-four field-complex residues, including infinity,
   constant-annihilation and the explicit/inductive bridge.
8. Replaced unjustified unscaled diagonal-Suslin agreement by the task of
   computing its nonzero rational coefficient κ for `r₄=18 f₀` and specifying
   the required rescaling. The abstract quotient theorem does not determine κ.
9. Removed false universal Lean claims, kept valid native/raw constructions,
   and marked the missing actual-parent statements explicitly. Fixed negative
   rational literals and decidability for the unit-class definition. The degree
   two comparison example now applies `configurationComparison` itself.

No mathematical nodes were added or removed. No other worker's file, the reader,
the parent packet, atlas data or upstream roadmap was edited.

## Independent source check

The three public PDFs were obtained independently and match the packet's
SHA-256 hashes:

| Source | Version and passages independently checked |
|---|---|
| [G95](https://sasha-goncharov.github.io/Advances1995.pdf) | Published *Advances in Mathematics* 114 (1995), 197–318; pp. 202–220, 239–241, 254–259 and 264–312. This includes the full §§4–5 comparison proof, §§7–8 duality and §9. High-resolution visual checks of pp. 208, 286–287, 293, 298 and 304 resolved OCR-sensitive formulas. |
| [GR5](https://arxiv.org/pdf/1803.08585v5) | 15 July 2026; §1.2 explicit B₃ presentation, §5.1 pp. 53–56 and §§7.1–7.3 pp. 61–68, including (135), (142)–(144), (149) and footnote 16. |
| [Z03](https://arxiv.org/pdf/math/0311111) | Zhao's 2003 supplement, p. 2 formula (3), with its nondegeneracy restrictions. Used only to cross-check the sixth coordinate argument, not as an unrestricted specialization theorem. |

Every node's hypotheses, locator and short excerpt were checked. Changes above
correct attribution and locator errors, rather than silently assigning a
quotation from one paper to another. Infinite fields suffice for generic
resolution acyclicity. Number-field hypotheses are retained for periods; the
characteristic-zero lifting target is narrower than the general field context.
The conditional transfer is for a simple finite extension and assumes the
weight-four resolution and compatible residue maps. G95 Theorem 8.1 applies
on the **no-four-collinear** locus. The distinction from generic vector tuples
is essential in the geometric proof.

Full reading of G95 §§4–5 found the primary choice-independence argument:
Proposition 5.3, Lemma 5.4 and the later reduction/relations prove Theorem A's
rational isomorphism, integrally qualified by 6-torsion. The old “proof unread”
gap is replaced by the actual unresolved **normalization adapter**, not retained
as an access excuse. Likewise, 3/2 in GR (149) is a skew-symmetrization factor;
it is not a proof that the positive 1/5 in (144) satisfies (143).

## Source findings

**E-P3-01 rejected.** The final c₂ display on published p. 298 visibly prints
H²(B_F(3)), already agreeing with p. 220 and (6.11b) p. 297. The original H¹
allegation is retained separately as historical input. The `printed` field now
records the actual H² expression, and its independent `review` rejects the
allegation. It is not an actual misprint or an additional source correction.

**E-P3-02 confirmed.** Use δ₂[x]=u(1−x)∧u(x), unnormalized alternation, the
§7 cross-ratio and zero-based deletion. For v(t)=(1,t,t²), t=1,2,3,5,7, exact
prime-exterior coordinates give:

| Fixture | d₂r₅ | Printed 2 Alt₄ after deletion | Corrected −3 Alt₄ after deletion |
|---|---|---|---|
| Moment five-tuple | 36·u(2)∧u(3)∧u(5) | −24·u(2)∧u(3)∧u(5) | 36·u(2)∧u(3)∧u(5) |
| First vector scaled by 2 | 18·u(2)∧u(3)∧u(5) | −12·u(2)∧u(3)∧u(5) | 18·u(2)∧u(3)∧u(5) |

The nonconic five-tuple (1,8,2),(7,3,11),(1,3,2),(9,4,3),(3,1,11)
agrees with the corrected formula in all 31 nonzero exterior coordinates and
has the same ratio −3/2 against the printed formula. The independent test is
exact rational arithmetic, not numerical approximation. Distinct-prime unit
classes are rationally independent. G95's four-term f₀ gives Alt₄=−6 f₀.

**E-P3-03 confirmed as a proof gap.** Published p. 310 explicitly omits the
higher-differential computation and states that its result lifts the kernel to
H₅(PGL₃). It does not display the differentials or identify the final stable
configuration comparison map. This is not evidence that the lifting theorem
is false. The stronger H¹Γ≃K₅^(3) assertion is not inserted.

**E-P3-04 confirmed.** The sixth cyclic argument in published (1.16) p. 208 is
positive as printed. At a=b=c=1 that gives 6[1]+[−1], whose L₃ value is
21ζ(3)/4. The negative argument gives the source's p. 210 specialization
3[1]+4[−1], which evaluates to zero because L₃(−1)=−3ζ(3)/4.
Zhao formula (3) independently has the corresponding negative denominator on
its nondegenerate locus. Continuity, rather than that restricted formula alone,
is required at the degenerate specialization.

**E-P3-05 added and confirmed.** Take the generic six-vector tuple

\[
 e_1,e_2,e_3,(1,1,1),(1,2,3),(1,3,2).
\]

In lexicographic zero-based triple order its twenty minors are
1,1,3,2,−1,−2,−3,1,−1,−5,1,1,1,−2,−1,1,1,2,1,−3; none is zero.
Applying δ₂⊗1 to the alleged left-square equality (143) is legitimate even
without any injectivity assertion. Expand rational units in the prime basis,
with −1 killed as torsion. All its nonzero coordinates are:

| Coordinate (v_p∧v_q)⊗v_r | Printed +(1/5) Alt₆ | r₅∂ | Corrected −(1/5) Alt₆ |
|---|---:|---:|---:|
| (2,3,2) | 60 | −60 | −60 |
| (2,3,5) | −24 | 24 | 24 |
| (2,5,2) | −12 | 12 | 12 |
| (2,5,3) | −12 | 12 | 12 |
| (3,5,2) | 12 | −12 | −12 |
| (3,5,3) | 36 | −36 | −36 |

The second generic fixture
(1,8,2),(7,3,11),(1,3,2),(9,4,3),(3,1,11),(2,5,9)
has 722 nonzero coordinates; every printed coefficient is the negative of the
boundary coefficient. The moment six-tuple lies on a conic and gives zero on
both sides; it cannot detect this sign error. A sign reversal in r₄ does not
repair this different square. No full B₂-valued equality is claimed from these
projected computations.

The following portable standard-library calculation reproduces the nonzero
(2,3,2) witness. Determinants use the tuple vectors as rows; transposition has
no effect on their determinant. `val(0)=0` matches the native coordinate test
at T=1. For generic projected cross-ratios neither x nor 1−x is zero.

```python
from fractions import Fraction as Q
from itertools import permutations
from math import prod

def sign(p):
    return (-1) ** sum(p[i] > p[j]
                       for i in range(len(p)) for j in range(i+1, len(p)))

def det(v):
    return sum(sign(p) * prod(v[i][p[i]] for i in range(3))
               for p in permutations(range(3)))

def minor(v, *i):
    return det([v[j] for j in i])

def val(p, x):
    x = Q(x)
    if not x:
        return 0
    out = 0
    for n, s in ((abs(x.numerator), 1), (x.denominator, -1)):
        while n % p == 0:
            out += s
            n //= p
    return out

def coord(x, y):
    return (val(2, 1-x)*val(3, x) - val(3, 1-x)*val(2, x))*val(2, y)

def projected(v):
    return Q(minor(v,0,1,3)*minor(v,0,2,4),
             minor(v,0,1,4)*minor(v,0,2,3))

def triple(v):
    return Q(minor(v,0,1,3)*minor(v,1,2,4)*minor(v,0,2,5),
             minor(v,0,1,4)*minor(v,1,2,5)*minor(v,0,2,3))

def r5(v):
    out = Q(0)
    for p in permutations(range(5)):
        w = [v[i] for i in p]
        out += sign(p)*coord(projected(w), minor(w,2,3,4))
    return out

v = [(1,0,0),(0,1,0),(0,0,1),(1,1,1),(1,2,3),(1,3,2)]
top = sum(sign(p)*coord(triple([v[i] for i in p]),
                        triple([v[i] for i in p]))
          for p in permutations(range(6))) / Q(5)
boundary = sum((-1)**i*r5(v[:i]+v[i+1:]) for i in range(6))
assert (top, boundary) == (60, -60)
assert -top == boundary
```

Public-version and author/publisher/title/erratum searches found no relevant
correction. G95 findings are against its published scan, whereas E-P3-02/05
are v5 preprint findings. No source theorem is silently replaced by a verified
Lean proof.

## Pinned library audit

Every original declaration's full statement was read independently at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. All 25 exist with the required
hypotheses. The one metadata correction is a declaration kind, not a failed
baseline. Native homology/totalization provide infrastructure; they do not
provide configuration resolutions, quasi-isomorphisms or comparison theorems.
No Tau Ceti declaration was cited in the packet, so the Tau Ceti pin introduces
no unchecked baseline citation.

| Declaration | Module under `Mathlib/` and checked scope |
|---|---|
| `Finsupp.linearCombination` | `LinearAlgebra/Finsupp/LinearCombination.lean`: Evaluation of a finite rational formal sum in a rational module. |
| `Finsupp.lmapDomain` | `LinearAlgebra/Finsupp/Defs.lean`: Linear pushforward of a finite formal sum along a function. |
| `Submodule.liftQ` | `LinearAlgebra/Quotient/Basic.lean`: A linear map vanishing on a submodule factors through the native quotient. |
| `LinearIndependent` | `LinearAlgebra/LinearIndependent/Defs.lean`: Injectivity of the finite linear-combination map; used on each subset of a vector tuple. |
| `Matrix.det` | `LinearAlgebra/Matrix/Determinant/Basic.lean`: Native determinant, with rows indexed by a finite type. |
| `Matrix.det_mul` | `LinearAlgebra/Matrix/Determinant/Basic.lean`: Determinant multiplicativity, including the GL change-of-volume factor. |
| `exteriorPower.ιMulti` | `LinearAlgebra/ExteriorPower/Basic.lean`: Native alternating insertion into the third exterior power, not the antisymmetric tensor quotient. |
| `exteriorPower.alternatingMapLinearEquiv` | `LinearAlgebra/ExteriorPower/Basic.lean`: Universal linear map out of the native exterior power from an alternating map. |
| `exteriorPower.linearMap_ext` | `LinearAlgebra/ExteriorPower/Basic.lean`: Extensionality on wedges. |
| `TensorProduct.lift` | `LinearAlgebra/TensorProduct/Basic.lean`: Native bilinear-to-linear universal property. |
| `TensorProduct.map` | `LinearAlgebra/TensorProduct/Map.lean`: Tensor product of linear maps with evaluation on pure tensors. |
| `CategoryTheory.ShortComplex.homology` | `Algebra/Homology/ShortComplex/Homology.lean`: Homology of a short complex with HasHomology, not a replacement cohomology theory. |
| `CategoryTheory.ShortComplex.homologyMap` | `Algebra/Homology/ShortComplex/Homology.lean`: Homology functor on morphisms of short complexes. |
| `Representation.Coinvariants` | `RepresentationTheory/Coinvariants.lean`: Native representation coinvariants V/span{ρ(g)x−x}; generic configurations use this existing quotient. |
| `Matrix.GeneralLinearGroup` | `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: Units of square matrices, providing the simultaneous GL action. |
| `groupHomology` | `RepresentationTheory/Homological/GroupHomology/Basic.lean`: Native group homology of a bundled representation, as ModuleCat objects. |
| `Rep.trivial` | `RepresentationTheory/Rep/Basic.lean`: Trivial coefficient representation for rational GL homology. |
| `HomologicalComplex₂.total` | `Algebra/Homology/TotalComplex.lean`: Native totalization with two anticommuting signed differential components. |
| `Projectivization` | `LinearAlgebra/Projectivization/Basic.lean`: The native quotient of nonzero vectors by scalar units; provides the points of P² used in the geometric presentation. |
| `DirectSum.lof` | `Algebra/DirectSum/Module.lean`: Native linear inclusion of each module into its dependent direct sum. |
| `NumberField.dedekindZeta` | `NumberTheory/NumberField/DedekindZeta.lean`: Dedekind zeta as the complex L-series of integral-ideal norm counts. |
| `NumberField.discr` | `NumberTheory/NumberField/Discriminant/Defs.lean`: Absolute number-field discriminant in Z, using the ring-of-integers basis. |
| `NumberField.InfinitePlace.nrRealPlaces` | `NumberTheory/NumberField/InfinitePlace/Basic.lean`: Cardinality of the subtype of native real infinite places. |
| `NumberField.InfinitePlace.nrComplexPlaces` | `NumberTheory/NumberField/InfinitePlace/Basic.lean`: Cardinality of the subtype of native complex infinite places. |
| `NumberField.InfinitePlace.embedding` | `NumberTheory/NumberField/InfinitePlace/Basic.lean`: A chosen complex field embedding inducing each infinite place. |
| `padicValRat` | `NumberTheory/Padics/PadicVal/Basic.lean`: Integer prime valuations of rational numbers; the coordinate test uses only primes 2 and 3, and the native zero convention at triple ratio 1. |

`Submodule.liftQ` requires an actual kernel inclusion. `ShortComplex.homologyMap`
requires the native homology instances. `HomologicalComplex₂.total` requires
anticommuting signed components. `groupHomology` uses a bundled representation
and returns a ModuleCat object. `Matrix.GeneralLinearGroup` is units of matrices.
`NumberField.discr` is an integer abbreviation; `embedding` is the chosen complex
embedding at a native infinite place. These conventions were checked rather
than inferred from declaration names.

## Node-by-node check

All node names below have prefix `Polylogarithms:P.3/`. “Verified” checks the
mathematical contract and its proof route with its identified suppliers; it
does not supply an omitted actual-parent Lean signature.

| Node | Verdict and independent evidence |
|---|---|
| `coordinate-relation` | **corrected**. The signed coordinate formula and all three formal-sum tests were checked independently; (1.17) is on p. 208, while p. 210 has an unnumbered specialization. Quotient evaluation needs the actual parent symbol, now explicitly omitted rather than falsely universal. |
| `relation-cobracket` | **verified**. GR §5.1 Proposition 5.4 proves relation-cobracket vanishing in the explicit B₂ presentation. The quotient and differential are parent inputs, not arbitrary module maps; the unfaithful generic signature was removed. |
| `generic-vector-configurations` | **corrected**. Native GL coinvariants give precisely the free rational module on vector orbits. Genericity, deletion/projection dimensions and the unequal rank-one ratios are sound. Corrected the G95 definition locator to p. 255 and separated the GR citation. |
| `weight-three-bigrassmannian` | **unverifiable**. The weight-three quotient and zero-based differential signs match the sources, but its component and field-map API are only comments; no component formula constrains the placeholder differential. Finite direct-sum transport is routine and should be supplied. |
| `projected-cross-ratio` | **verified**. The §7 cross-ratio is the inverse of the V.4 convention. Exact determinant computation gives 6/5 and 5/6; Plücker gives the exclusions 0 and 1. The missing ordered projective adapter is identified explicitly. |
| `exterior-configuration-map` | **corrected**. Independently confirmed −3 Alt₄=18 f₀, the nonzero 18·u(5)∧u(67)∧u(197) fixture and the zero conic fixture. Corrected source attribution and native unit-class decidability; the field-map interface remains omitted. |
| `middle-configuration-map` | **unverifiable**. The raw r₅ formula is correct, but arbitrary gen2 need not obey five-term relations, so the former GL descent, volume API and tests were false. Removed those signatures; a revision needs the actual B₂ symbol and d₂ law. |
| `triple-ratio-map` | **corrected**. Corrected r₆ to −(1/5) Alt₆ under the fixed differential signs. Raw ratios 10/9 and 1 are correct. Added a nonzero native valuation-coordinate test that detects the old sign; full B₂-valued chain compatibility remains unresolved. |
| `seven-term-configuration-relation` | **unverifiable**. GR Theorem 1.8 and the primary G95 geometric proof support the seven-term relation, but transport to the parent corrected explicit B₃ with the chosen normalization still needs the recorded adapter. Removed the assertion for arbitrary gen3. |
| `configuration-chain-comparison` | **unverifiable**. Both necessary coefficient corrections are reproduced, but applying δ₂⊗1 does not prove equality in B₂⊗U. Full left-square and projection identities require actual quotient laws and the geometric adapter, not arbitrary d₂ and δ₃. |
| `stabilized-configuration-comparison` | **unverifiable**. Read the full symmetrized resolution and stabilization construction. The prototype for arbitrary Γ also admits the zero map; four comparison APIs and the stabilized-cycle test are missing. The degree-two example now uses the actual configurationComparison term and agrees with p. 298. |
| `rank-two-vanishing` | **corrected**. The source supplies rank-two vanishing and the rank≤3/rank≤2 quotient. Removed the parent comparison conclusion as a proof input. Primitive-Hurewicz/rank interfaces remain supplier requests; no Adams-weight identification was imported. |
| `steinberg-boundary-image` | **corrected**. The rational Milnor presentation gives precisely the Steinberg span. Removed the parent Milnor-comparison conclusion from prerequisites and the false range assertion for arbitrary d₂. A faithful signature must bind the generating symbols and differential law. |
| `cohomology-transfer` | **unverifiable**. Conjugating the genuine Milnor norm by η gives the correct transfer; the native conjugation/id/composition prototypes are valid. Restriction, product and residue API and the quadratic test are missing; the abstract exterior-power scaling test alone does not instantiate finite-extension norms. |
| `suslin-top-comparison` | **unverifiable**. The Suslin quotient isomorphism does not compute the diagonal/primitive scalar of the corrected c₃. Replaced unjustified unscaled equality by a request to compute κ and specify its rescaling; this remains open and with the original owners. |
| `trilogarithm-descent` | **unverifiable**. The genuine analytic L₃ has the stated constants and symmetries, but arbitrary L₃/gen3C cannot descend or satisfy its values. Removed the false generic signatures; actual parent quotient/function and kernel-inclusion interfaces are required. |
| `configuration-borel-class` | **unverifiable**. Theorem 1.9, Proposition 1.11 and Theorem 9.1 support the continuous class and two-dimensional measurable calculation. The actual measurable/continuous and parity/primitive interfaces are missing; nonzero normalization cannot be manufactured as a field. |
| `cycle-lifting` | **unverifiable**. G95 §9.2 omits the higher-differential calculation. It asserts a ker δ₃ lift to H₅(PGL₃); equality with the stable configuration comparison and primitive pairing still need the recorded adapters. No H¹Γ≃K₅^(3) is asserted. |
| `rational-regulator-calibration` | **unverifiable**. R.4 Tate coordinates and R.5 periods force π² per coordinate, but do not determine the universal rational class scalar. Removed the parent regulator comparison conclusion as a prerequisite; the R.7 request still must be fulfilled. |
| `regulator-image-containment` | **verified**. Given the explicitly identified lifting, primitive-pairing and calibration inputs, rational image containment follows. It is sufficient for the determinant argument and does not require an isomorphism of all H¹Γ with K₅. |
| `every-family-special-value` | **corrected**. Corrected the source locator and NumberField.discr declaration kind. Multiplying the R.5 period by π^(2(r₁+r₂)) gives π^(−3r₂). det=q·period correctly allows dependent families. Removed the false statement for arbitrary regAt; the actual regulator and open lifting inputs remain essential. |
| `trilogarithm-functional-relations` | **unverifiable**. The negative sixth argument is independently confirmed, but the packet still lacks the requested full analytic continuation/constant argument for this explicit coordinate expression. Removed the assertion for every arbitrary complex function L₃. |
| `conditional-complex-transfer` | **corrected**. The construction is conditional, derived and requires weight four. P.5 supplies a complex-variety exterior residue, not this field-complex infinity map; removed that citation and strengthened the P.4 request and hypotheses, including the explicit/inductive bridge. |
| `geometric-trilogarithm-presentation` | **unverifiable**. Read the geometric six-point quotient and rational intersection relation independently. The prototype leaves its generating submodule and triangle representative unspecified, and the nonzero triangle test is missing. Those native constructions must be made concrete before the adapter can be checked. |
| `geometric-trilogarithm-comparison` | **unverifiable**. Read full G95 §§4–5, especially the choice-independence proof and Theorem A; rationalization removes the 6-torsion qualification. The exact adapter to the corrected coordinate quotient and map remains open. Removed the false isomorphism to arbitrary B₃; split source IDs and tracked −2/15 versus printed 3/2. |
| `configuration-duality` | **unverifiable**. Kernel/annihilator duality and all three small tests are mathematically sound. General involution, matrix and face signatures are only comments. Fin-index transports are routine mathematical data, not unavailable supplier notions; they should be supplied in the revision. |
| `trilogarithm-duality` | **verified**. Inspected Theorem 8.1 visually and read its cancellation proof: the hypothesis is no four collinear, not merely generic. The equality in G₃ and its sign are supported; the separate normalization/explicit-quotient adapter remains recorded. |

## Suggested file and discriminating coverage

The original header's assertion that module variables represented “actual
objects” had no effect on Lean quantification. Several concrete counterexamples
show the problem independently of elaboration:

- For `relation22_quotient`, choose B₃=ℚ and gen3 the indicator of 1.
  R(1,1,1) evaluates to 3 rather than zero.
- For `configMiddle_moment`, choose d₂=0. The asserted right side is a nonzero
  rational prime exterior wedge. Arbitrary gen2 also need not obey the
  five-term law needed for volume cancellation and GL descent.
- For `steinberg_boundary_image`, choose d₂=0 over ℚ(t,u). The Steinberg
  wedge u(1−t)∧u(t)∧u(u) has a nonzero coordinate at the independent
  divisorial valuations 1−t, t and u. Its span is not zero.
- For `trilogDescent_mk`, choose gen3C=0 and L₃ the constant function 1.
  A linear map cannot take zero to 1. The asserted special values and functional
  relations also fail for arbitrary functions.
- For `every_family_special_value`, F=ℚ has one place. Arbitrary linear regAt
  on a one-dimensional ℚ module can take its generator to any real number;
  only a countable set lies in the proposed rational period line.

The seven-term, chain comparison and geometric isomorphism statements likewise
needed actual quotient/differential laws. Removed claims are now honest “not
stated” comments under PROTOCOL §13. They remain proposed names in the packet
and are **not counted as supplied signatures**. The review is needs_changes;
this omission is not concealed as successful formal coverage. Native formula,
coinvariant, exterior, duality and conjugation-of-norm prototypes remain.

After correction, the following API/test names still lack actual signatures.
All names use namespace `TauCeti.Polylog.WeightThree`.

| Node | Missing API signatures | Missing test examples |
|---|---|---|
| `coordinate-relation` | `relation22_quotient` | `none` |
| `weight-three-bigrassmannian` | `bigrassmannianD_component`, `bigrassmannian_map` | `none` |
| `projected-cross-ratio` | `projectedRatio_blochCrossRatio` | `none` |
| `exterior-configuration-map` | `configExterior_fieldMap` | `none` |
| `middle-configuration-map` | `configMiddle`, `configMiddle_mk`, `configMiddle_volume`, `configMiddle_alt`, `configMiddle_fieldMap` | `configMiddle_moment`, `configMiddle_scaleVolume`, `configMiddle_notProjective` |
| `triple-ratio-map` | `configTrilog_fieldMap` | `none` |
| `stabilized-configuration-comparison` | `configurationComparison_stabilize`, `configurationComparison_rank3`, `configurationComparison_fieldMap`, `configurationComparison_K` | `configurationComparison_stableFixture` |
| `cohomology-transfer` | `h3Transfer_res`, `h3Transfer_projection`, `h3Transfer_residue` | `h3Transfer_quadratic` |
| `trilogarithm-descent` | `trilogDescent`, `trilogDescent_mk`, `trilogDescent_sum`, `trilogDescent_conj`, `trilogRegulatorAt`, `trilogRegulatorAt_conj` | `trilogDescent_zero`, `trilogDescent_one`, `trilogDescent_minusOne` |
| `geometric-trilogarithm-presentation` | `none` | `geometric_triangle_nonzero` |
| `configuration-duality` | `configurationDual_sq`, `configurationDual_matrix`, `configurationDual_faces` | `none` |

All 15 `declarationName` theorem/comparison names also remain explicitly not
stated. A revision must bind their real supplier interfaces rather than restore
the old arbitrary-variable claims. The packet's APIs describe useful operations,
but comments alone do not meet §13.

For `configurationComparison`, sending zero to zero and having the expected
type do not reject the zero map. Its stable nonzero-cycle fixture and concrete
rank-three edge formula are essential. For the geometric quotient, the generated
relation families and the triangle representative should be actual native data.
For bigrassmannian and duality APIs, finite-index transports and direct-sum
component formulas are ordinary implementation work; they do not warrant a
supplier-access gap. For transfers the scalar d³ law is a useful contrasting
calculation, but the genuine quadratic restriction/norm test and residue/product
maps are still needed. The new nonzero top coordinate rejects the positive
coefficient missed by the old raw-ratio tests.

## Closure, ownership and assembly actions

The local graph is acyclic and retains the original owners. The five requests
name precise missing extensions, rather than redefining Milnor K-groups,
primitive Hurewicz, group homology, Borel classes or derived categories here:

- GeneralAlgebraicKTheory owns rational primitive Hurewicz, the block-sum Hopf
  structure, primitive/decomposable splitting and rank comparison. Its current
  plus stage does not supply all those interfaces or the diagonal scalar.
- K3BlochGroups V.4 owns integral configuration hyperhomology and Suslin's
  homological quotient/stability theorem. Extending its complex and coefficient
  interface to the symmetrized rational resolution is a precise Part II request.
  Suslin's primary-proof access gap stays with that owner.
- K2SymbolsBrauer T.2/T.3/T.4 owns Milnor symbols, tame residues and transfer.
  The existing Milnor–Quillen transfer comparison is degree two; degree three
  needs the separate request. Exterior powers of the field norm are not that
  transfer.
- BorelRegulators R.4/R.5 owns the actual normalized regulator and zeta periods.
  R.7 is asked for measurable/continuous and exact normalization adapters. Real
  one-dimensionality does not give rationality or the required π² conversion.
- Polylogarithms P.4 owns the higher-weight resolution, its field-complex residues
  and the explicit/inductive presentation bridge. P.5's exterior residue is not
  a replacement. The transfer remains conditional and derived; tower independence
  does not follow from a simple-extension recipe.

Questions/actions for the orchestrator:

1. Route a revision of this same target-level part to finish the faithful
   signatures and discriminating tests listed above. Retain the explicit lifting
   and normalization proof gaps rather than assuming the desired comparisons.
2. Synchronize the part reader, which this review issue does not authorize editing:
   r₆ must have the negative sign; the page 298 allegation must be rejected;
   source dates/locators, Suslin normalization and the conditional residue supplier
   must agree with the corrected packet. Its current positive formula prevents
   acceptance of the document/packet pair.
3. Preserve both confirmed GR findings and the rejected G95 finding when routing
   errata work. Does the author have a revised B₂-valued chain-map proof or later
   version resolving the two v5 coefficients? Coordinate agreement alone should
   not be promoted as that proof.
4. During assembly reconcile the parent's unrestricted K comparison with the
   rank≤3/rank≤2 domain, its rational-only regulator wording with R.4's Tate
   coordinates, and its all-family determinant orientation with det=q·period.
   These are already upstream notes; this review did not modify the parent.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/Polylogarithms--P.3.json`
reports zero errors and zero warnings. The shared source-finding and source-version
validators pass. All 27 nodes have independent verdicts; all five source findings
have review records. `git diff --check` passes.

The corrected suggested file **elaborated successfully with exit status zero**
using `lean-check` in the existing build at the pinned Mathlib commit. Available
memory was 107 GB before the final check. Its 73 warnings are exclusively
`declaration uses sorry`; there were no errors or other warnings. No language
server or build/cache/update operation was used. This checks the retained
signatures, not their mathematical placeholder proofs or the omitted interfaces.
