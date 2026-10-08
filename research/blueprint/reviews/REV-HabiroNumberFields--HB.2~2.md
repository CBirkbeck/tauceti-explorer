# Independent revision review of HB.2

Job `REV-HabiroNumberFields--HB.2~2`, issue #7056. Codex, session
`codex-ZvV5hI`, 2026-10-08. This reviewer wrote neither the original plan nor
its revision. Inputs include the previous independent review and the revision
handoff, together with the packet, definitive reader and suggested file.

**Verdict: accepted.** All four new nodes and six baseline citations are
verified. The reader incorporates every correction requested by the previous
review. The packet is a complete target-level planning pass with `planned`
coverage and precise remaining obligations. Acceptance does not assert that
these proofs are closed or formalised.

## Counts and changes

| Item | Count | Result |
| --- | ---: | --- |
| New nodes | 4 | All verified; none added, removed or mathematically changed |
| Parent imports | 28 | Ids, stage scope and convention-sensitive interfaces checked |
| Baseline declarations | 6 | Exact-pin statements confirmed; none replaced or removed |
| Construction API items / unit tests | 8 / 4 | All checked against packet and prototype |
| Node/source locator records | 10 | Checked against five independently downloaded PDFs |
| Source findings | 5 | Independently confirmed under this review's job id |
| Supplier requests / gap records | 7 / 3 | Retained as explicit obligations |
| Coverage remaining entries | 5 | Precise; coverage remains planned |
| Proposed stage edges | 8 | Sequential insertion produces no reverse path |
| Confirmed supplied red-team findings | 4 | All handled with the correct owner and scope |
| New planets | 1 | Named Kashaev–Mangazeev–Stroganov identity |

Changes in this review are the acceptance record, current baseline and
source-finding attestations, a separate revision-verification record, and
reader provenance distinguishing current checks from earlier checks. The first
three source-finding descriptions were paraphrased rather than reproducing
source displays. Mathematical statements, dependencies, API, tests, suggested
signatures and planet choices needed no further correction. The previous
report remains the historical record of the first review's corrections.

## Required revision repairs

The reader now uses a small simply connected neighborhood of
`(X,Y)=(1/5,2)`, with `Z=(1−X)/(1−Y)`, compatible nth roots,
`|X/Y|<|Z|<1` and `Re S>0` (section 3.1). At its center `Z=−4/5`,
`S=4/9` and `C/S=169/16`. Exact rational arithmetic confirms these values.
The counterexample `X=9/10,Y=2` gives `|X/Y|=9/20>|Z|=1/10`,
so the former overly broad convergence claim has been removed. Generic
nonreal parameters and continuation across removable summand singularities
are explicitly distinguished from uniform tail estimates.

Section 5 now requires `N=ℓ^m≥3`, with ℓ an odd prime and `m≥1`.
It separately cites Hutchinson v4 section 4, p.6 for the explicit Bott Chern
value and Soulé's thesis section 2.2.4.3, pp.51–54 for Kummer normalization.
The locator for Hutchinson Proposition 4.6 is p.7. Sections 1 and 4 distinguish
the 2013 left periodic resolution from the 2024 right resolution, then justify
compatibility of the positive degree-two and degree-three homology classes.
Section 8 records the fifth editorial source finding and accurately qualifies
compilation and historical verification. No unresolved packet/reader
contradiction remains.

## Mathematical checks

### Cyclic hypergeometric sum

CGZ section 2.5, p.398 and GZ Appendix A (56), p.235 support the finite
expression, including the k=0 term and the product start at ζy. Its total
field definition is allowed independently of cyclic hypotheses; cancellation
uses the stated nonvanishing assumptions. Primitivity and `x^n≠1` make
all cyclic denominators nonzero. The relation `(1−y^n)z^n=1−x^n`
gives the required periodic summand recurrence. Summing that recurrence
independently gives the shifted-z API identity.

The eight API items provide defining data, boundary values, the order-two
formula, field-homomorphism compatibility, diagonal cancellation, geometric
vanishing and the cyclic shift. A scalar finite expression needs no additional
quotient universal property. The four tests detect boundary mistakes and a
wrong product start: the rational order-two value is `23/3`, and the
order-three complex diagonal comparison is zero. The suggestion has the same
hypotheses and expressions.

### Odd-order KMS identity

The cleared identity matches CGZ section 2.5, p.398, (C.7), and GZ
Appendix A, Proposition 8.1 (55), pp.235–237. Nonzero parameters,
`X,Y≠1`, `X≠Y` and the curve relation justify the rational form;
n=1 is a separate empty-product identity. No even-order theorem is claimed.

The proof route now accounts for the Gaussian order factor, eta power and
phase, exact q-dependent product shifts and the full complex dilogarithm
identity. It works in the admissible neighborhood above. Uniform two-sided
tails are not deduced from a fixed-residue expansion: QM.0 must supply them.
Likewise P.1 must supply the complete complex identity B=0 with compatible
branches, rather than only its Bloch–Wigner imaginary part.

The integral descent is coherent: clear denominators on the monic cyclotomic
surface `x^n=1−z^n+y^nz^n`. The right side has a simple divisor over
`C(y,z)`, excluding a nontrivial power and giving the required binomial
irreducibility. Equality on an analytic open sheet forces the reduced
coefficients to vanish. Injectivity of the cyclotomic embedding and freeness
of the monic quotient descend the equality integrally. Specialization to
characteristic prime to n follows without embedding such a field in C.
These are target-level proof steps, not new duplicate analytic declarations.

### Eta bar/Bloch specialization

Hutchinson 2013 sections 6.3–6.4, pp.31–33 give the actual refined
configuration formula; Hutchinson v4 section 3 (1), pp.5–6 gives its
cyclotomic specialization. The auxiliary terms reduce to `[0]` in the CGZ
odd-coefficient convention. The Chebyshev recurrence gives the internal eta
terms, while the omitted terms contribute `[∞]+2[0]=[0]`.
The N=3 empty internal sum must therefore retain `[0]`; N=5 has the two
expected internal terms.

The left and right degree-three coinvariant bar chains agree. Their degree-two
chains both have boundary `N[t]`; injectivity of the Bockstein, using
`H₂(C_N,Z)=0`, identifies the positive classes. This compares homology
classes without identifying the two resolutions. Multiplying the diagonalizing
matrix on the right by `diag(d⁻¹,1)` preserves conjugation and gives
determinant one. Restriction to E occurs in K-theory, since the Bloch class
can die after extension. The generic configuration map remains V.4's export;
HB.2 owns only this specialization.

### Signed Chern evaluation

Hutchinson v4 section 2.3, Corollary 2.13, p.5 and section 4, pp.6–7
supply the negative product coefficient, positive Bott convention and eta
product. Soulé's thesis Proposition 2.2.3.3, p.49 independently supplies
the integral-class times finite-coefficient formula needed here. It is not
presented as a proof for two arbitrary finite-coefficient factors.

With `∂β=ζ`, standard Kummer cocycle `σ(α)/α` and the stated
untwisting, the raw Chern evaluation is `−δ(ζ)∪ζ`, hence `[ζ⁻¹]`.
Bidegrees (1,0) add no further sign. Negating the degree-(2,1) map
independently of eta gives the specified positive normalization and `[ζ]`.
The tests distinguish these classes: a cube root of ζ₃ would require a
primitive ninth root in a quadratic field; in F7 the cube subgroup is
`{1,6}`, separating 2 from its inverse 4.

This does not identify either convention with the fixed CGZ/GSWZ map.
The parent sign-comparison gap remains explicit. Inverting the Chern map
also inverts its square. The downstream regulator evaluation is still needed
to determine the comparison scalar.

## Baseline and ownership

Actual statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

| Declaration | Module | Verified use |
| --- | --- | --- |
| `IsPrimitiveRoot` | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean` | Exact order and exponent divisibility |
| `IsPrimitiveRoot.geom_sum_eq_zero` | Same | Domain and order greater than one |
| `TauCeti.powerClassQuotient` | `TauCeti/Algebra/Group/PowerClassGroup.lean` | Commutative-group quotient by nth powers |
| `TauCeti.powerClassHom` | Same | Quotient homomorphism |
| `TauCeti.kummerClassMap` | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean` | n invertible and standard cocycle convention |
| `TauCeti.kummerClassMap_injective` | Same | Injectivity, without a surjectivity assertion |

AUDIT-28 in `data/library-coverage.json` does not identify an existing
implementation of these four new targets. ProfiniteCohomology Layer 9
already owns the Kummer inverse and canonical/explicit compatibility; Layer 8
owns cups. Neither is re-planned. Read that upstream document and the
GrothendieckEulerForms document for roadmap structure.

Read the supplier statements in V.2, V.3, V.5, QM.0, QM.1 and P.1,
the existing Bass–Tate import and its proof gap, and the already-owned HB.4
Andrews–Gordon target. The seven requests specify missing exports without
duplicating definitions. The early finite-Chern prefix is explicitly
`after-split-only`; unsplit M.8, with its later regulator prerequisites, is
not imported. The eight proposed edges pass the reverse-path check in the
extracted atlas graph.

| Red-team finding | Verified handling |
| --- | --- |
| RT-AREA-ktheory-2/2 | Scalar-two assembly is downstream HB.5, reusing HB.4 and CGZ Theorem 7.4; no HB.4→HB.2 cycle |
| RT-AREA-ktheory-2/13 | Actual V.5 comparison maps imported; unstable finite-field homology is used away from the characteristic |
| RT-AREA-ktheory-2/18 | One finite-Chern owner, requested early M.8 prefix with M.7 input and an explicit sign gap |
| RT-AREA-ktheory-2/19 | One Bass–Tate statement retained, arithmetic proof closure after T.7 requested without a reverse edge into all of T.2 |

The named KMS planet is appropriate. Five parent landmarks are retained;
the parent's unconditional Hutchinson-refinement landmark is assigned to HB.5
in the rescope proposal, giving six selected HB.2 landmarks. Applying that
parent rescope is an assembly/maintainer action, not a mutation of another
job's packet.

## Sources, findings and validation

All five public downloads match the packet's SHA-256 hashes. Node locators
were checked in the [CGZ published PDF](https://math.uchicago.edu/~fcale/papers/CGZ.pdf),
[GZ published PDF](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf),
[Hutchinson 2013 v2](https://arxiv.org/pdf/1107.0264v2),
[Hutchinson 2024 v4](https://arxiv.org/pdf/2104.14413v4) and
[Soulé's author-hosted thesis](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf).
No new publisher-version access is claimed for the latter three sources.
Published GZ pp.236–237 were additionally inspected as rendered pages.

All five findings are independently confirmed: EHB2.1 reverses the Gaussian
numerator sign; EHB2.2 corrects the Gaussian order factor, eta power and
exponential sign; EHB2.3 retains the q-dependent argument shifts and is an
error in the leading constant; EHB2.4 restores the nontrivial Dedekind phase;
EHB2.5 changes the intended equation locator from the sum definition to the
KMS identity. Author-index, arXiv-record and correction/erratum searches found
no correction to these Appendix A findings. CGZ's published p.424
acknowledgement concerns its own earlier Nahm normalization and Bloch-group
definition, not these GZ Appendix A findings.

Independent finite-field checks covered all admissible triples for fixed
primitive roots at orders 3,5,7,9 in F19,F31,F43,F73: respectively
108,500,1372,4374 cases. All 6354 passed both KMS and shifted-z identities.
All 18 primitive-root phase checks passed, with maximum relative numerical
discrepancy about `5.7×10⁻¹⁴`. Ramanujan-product evaluations at
ε=.02,.01,.005 approached the corrected Gaussian constant: relative errors
`.008753,.004368,.002182` for order three and
`.015067,.007510,.003749` for order five. These checks corroborate the
normalizations, without proving uniform analytic tails.

The full suggested file did **not** elaborate. `lean-check` stopped at the
missing `TauCeti.Algebra.Group.PowerClassGroup` object file. The shared build
has pinned Mathlib and a different Tau Ceti revision, so it cannot establish
full elaboration at both pins. Exact-pin Tau Ceti statements were read from
git objects. No build, cache download, checkout mutation or new extraction
was performed. The earlier Mathlib-only elaboration remains historical and
does not validate the full file. Missing Bloch/K-theory/Chern supplier types
are explicitly noted instead of replaced by proposition-valued placeholders.

`python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNumberFields--HB.2.json`
passes with zero errors and zero warnings. The review leaves no unresolved
contradiction or unverifiable new node.

## Orchestrator handoff

No further revision is requested. Retain the three recorded gap families and
five coverage obligations for supplier/follow-up work: common analytic exports,
full complex dilogarithm identity, generic bar map, early finite-Chern/sign
comparison, Bass–Tate proof closure and downstream scalar-two assembly as
specified by their requests. The maintainer must assign the early M.8 split
identifier and apply the already-proposed parent landmark rescope. These
explicit future obligations do not prevent acceptance of this finished pass.
