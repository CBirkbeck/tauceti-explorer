# Independent review of HB.2

Job `REV-HabiroNumberFields--HB.2`, issue #6446. Codex (GPT-6), session
`codex-5w7FQz`, 2026-10-06. The input was written by session `codex-in1rju`.

**Verdict: needs changes.** The corrected packet gives a sound target-level
plan with explicitly recorded supplier and normalization obligations. Its
definitive [reader](../readmes/HabiroNumberFields--HB.2.md) still gives an
insufficient convergence domain and omits the prime hypothesis in the Chern
evaluation. This issue authorizes corrections to the packet and suggestion,
but lists the reader only as an input. The exact reader corrections are below.
These inconsistencies prevent acceptance; the honestly recorded mathematical
gaps and the unavailable full Lean check do not, by themselves, justify rejection.

## Scope and counts

| Item | Reviewed | Outcome |
| --- | ---: | --- |
| New nodes | 4 | 1 verified, 3 corrected |
| Parent imports | 28 | Ids and ownership retained; convention-sensitive uses qualified |
| Baseline citations | 6 | All confirmed at the exact pins; none removed or replaced |
| Construction API items | 8 | All statements and signatures checked |
| Construction unit tests | 4 | Sufficient and discriminating; no replacements |
| Original node/source references | 9 | Checked against five downloaded primary texts |
| Additional source references | 1 | Explicit Bott Chern value on Hutchinson v4 p.6 |
| Supplied source findings | 4 | All confirmed; EHB2.3 reclassified as an error |
| Additional source findings | 1 | EHB2.5: an equation-reference misprint |
| Supplier requests / gap records | 7 / 3 | Precise planned obligations; no claim of closure |
| Proposed stage edges | 8 | Every insertion has no reverse path in the extracted atlas graph |
| Nodes added / removed | 0 / 0 | Target-level proof components were not split into lemma nodes |

The packet remains `status: complete`, meaning a finished planning pass. Its
single coverage record remains `planned`, with five specific remaining
obligations; it is not `closed`. Each original target is covered by the parent
interfaces, four refinements, or an identified supplier contract. The
unconditional scalar-two theorem belongs to the downstream HB.5 assembly.

## Corrections required in the definitive reader

1. **Section 3, the paragraphs beginning “Work first” and “The convergence
   domain” (currently lines 99 and 107).** Use a sufficiently small simply
   connected complex neighborhood of `(X,Y)=(1/5,2)`, with
   `Z=(1−X)/(1−Y)`, analytic nth roots, `|X/Y|<|Z|<1`, and `Re S>0`.
   At its center `Z=−4/5` and `S=4/9`. Work first on the generic nonreal
   subopen, as in GZ's proof, and continue across removable summand singularities.
   The assertion that `0<X<1<Y` implies convergence is false:
   `X=9/10,Y=2,Z=−1/10` gives `|X/Y|=9/20>|Z|`. The packet's proof,
   QM.0 request and P.1 request now use the explicit admissible neighborhood.
2. **Section 5, the opening hypothesis (currently line 233).** Say
   `N=ℓ^m≥3`, with **ℓ an odd prime and m≥1**. The parent Bott/Chern
   evaluation and Hutchinson's stated theorem have this hypothesis. An
   arbitrary odd integer ℓ does not specify the same coefficient regime.
3. **Section 5, the Soulé provenance paragraph (currently line 257).** Cite
   Hutchinson v4 §4 p.6 for the explicit equation `c̄_(1,0)(β)=ζ`.
   Soulé's thesis §2.2.4.3 corroborates the degree-one Kummer normalization;
   it is not the passage stating that explicit Bott value. The packet now
   distinguishes the two citations.
4. **Section 1's periodic-resolution convention and section 4's bar
   calculation.** Identify the `t−1` resolution as the **left** resolution
   used in Hutchinson 2013. The imported parent API follows Hutchinson
   2024's **right** bar resolution with `1−t`. The packet now explains
   compatibility of their degree-two and degree-three homology classes;
   this clarification should be carried into the reader.

The reader's provenance section should also acknowledge the fifth source
finding and the review's limited compilation result when revised. No reader
or parent-packet edits were made by this review.

## Node checks

### Cyclic hypergeometric sum: verified

The total field expression starts its products at `ζy` and includes the
`k=0` term. Field division makes the definition meaningful even when a
denominator vanishes; cancellation statements appropriately add nonvanishing
hypotheses. Primitive ζ and `x^n≠1` make every denominator in the cyclic
case nonzero. The relation `(1−y^n)z^n=1−x^n` gives periodicity.
The summand recurrence gives the stated shifted-z identity, including n=1.

The eight API statements cover the defining sum, n=0/1/2, field-homomorphism
compatibility, diagonal cancellation, geometric-sum vanishing and the cyclic
shift. This is a finite scalar expression, so an independent quotient
universal property or extensionality theorem is not missing. The four tests
include both boundary cases, `f_(2,−1)(2,3|5)=23/3`, which detects an incorrect
product start, and the order-three complex geometric-sum comparison.

### Odd-order KMS identity: corrected

The cleared finite identity matches CGZ §2.5 and GZ Appendix A (55). The
nonzero x,y,z hypotheses and `X,Y≠1`, `X≠Y` justify every cancellation in
the rational form. The claimed n=1 check is the separate empty-product
identity. The suggestion uses the imported D polynomial's finite evaluation,
not a competing cyclic-dilogarithm object.

The analytic route has the correct bilateral product, Gaussian scale, exact
q-dependent shifts, explicit Dedekind phase and full complex dilogarithm
identity. The corrected neighborhood above supplies convergence. The backward
recurrence gives a regular interpretation of negative-index ratios at removable
singularities; proofs may first work at generic nonreal parameters. Uniform
two-sided tails and common product limits are substantial supplier targets,
not consequences of a fixed-residue Taylor expansion. They remain explicit
QM.0 obligations. P.1 must supply the full complex identity B=0; its
Bloch–Wigner imaginary part alone would not suffice.

The integral descent is sound as a proof route: clearing denominators gives a
polynomial on the monic surface `x^n=1−z^n+y^nz^n` over `Z[t]/Φ_n(t)`.
The right side has a simple divisor, so it is not a dth power for any d>1
dividing n over `C(y,z)`. Irreducibility and analytic equality on an open
sheet give zero reduced coefficients. The cyclotomic embedding is injective;
the monic quotient is free over the coefficient ring. This descends the
identity integrally and permits specialization to characteristic prime to n.
It does not embed a positive-characteristic field into C.

Independently reran all admissible x,y,z for fixed primitive roots
`ζ=7,2,4,2` in `F19,F31,F43,F73`, at orders `3,5,7,9`: respectively
`108,500,1372,4374` successful checks, 6354 total. Clarified that these counts
are for a fixed primitive ζ while ranging over all admissible root choices
of X,Y,Z. Added the convergence witness and counterexample to acceptance.

### Eta bar/Bloch specialization: corrected

Read the actual refined cross-ratio and cyclic-resolution calculation in
Hutchinson 2013 §§6.3–6.4, including the auxiliary-point correction terms,
and its forgetful specialization in Hutchinson 2024 §3. The correction
reduces to `[0]` in the CGZ convention. The internal terms are exactly
the eta terms for k=2 through N−2, by
`u_j u_(j+2)/u_(j+1)^2=1−1/u_(j+1)^2`. The omitted three eta terms give
`[∞]+2[0]=[0]`. Thus N=3 has image `[0]`, not a zero obtained by dropping
the correction. The N=5 computation is consistent as well.

The diagonalizing matrix, multiplied on the right by `diag(d⁻¹,1)`, has
determinant one and preserves the conjugation. No GL₂-to-SL₂ implication
is assumed. Added explicit resolution compatibility: the two degree-three
coinvariant chains coincide; the degree-two chains have integral boundary
N[t] and equal positive Bockstein. Since `H₂(C,Z)=0`, that Bockstein is
injective, so the two finite-coefficient Bott generators agree. This
justifies using the parent right-bar API with the left homogeneous source.

The non-routine generic configuration map remains requested from V.4;
HB.2 owns its cyclotomic specialization. Restriction of eta in K-theory
must be used subsequently: replacing it by restriction in B(E)/N would
erase the cyclotomic class and invalidate the Bott argument.

### Signed Chern evaluation: corrected

Restored the odd-prime-power hypothesis. Corrected the locator of
Hutchinson v4 Proposition 4.6 from p.8 (references) to p.7. Added the
explicit Bott Chern normalization on p.6; the negative product coefficient
is on p.5. Soulé's thesis Proposition 2.2.3.3 supplies the negative
coefficient for an integral class times a finite-coefficient class, enough
for the integral unit ζ times β. It is not advertised as a proof of the
general product of two finite-coefficient classes.

With the stated positive Bott boundary, standard Kummer cocycle and
untwisting, the raw product formula gives `−δ(ζ)∪ζ`, hence `[ζ⁻¹]`.
The bidegrees (1,0) contribute no further graded sign. Independently
negating the degree-(2,1) map gives `[ζ]`. Neither definition depends on
its value at eta. The cubic-root test in `Q(ζ₃)` and the distinct inverse
power classes of 2 and 4 in F7 detect the sign difference.

Qualified the imported parent sign and eta interfaces: selecting a map
by its desired eta value does not construct or identify the fixed
CGZ/GSWZ map. Inverting c also inverts epsilon=c². The actual comparison
of those maps remains a precise gap, as does the early M.8 split.

## Baseline, suppliers, ownership and planets

Read each declaration at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, respectively:

| Declaration | Module | Relevant contract |
| --- | --- | --- |
| `IsPrimitiveRoot` | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean` | Exact order with its divisibility condition |
| `IsPrimitiveRoot.geom_sum_eq_zero` | Same | Domain, primitive root, order greater than one |
| `TauCeti.powerClassQuotient` | `TauCeti/Algebra/Group/PowerClassGroup.lean` | Quotient of a commutative group by nth powers |
| `TauCeti.powerClassHom` | Same | Actual quotient homomorphism |
| `TauCeti.kummerClassMap` | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean` | Field, n invertible; cocycle σ(α)/α |
| `TauCeti.kummerClassMap_injective` | Same | Injectivity of that map, with the same hypotheses |

Surjectivity is not supplied by the pin. Read ProfiniteCohomology Layer 9:
its canonical/explicit Kummer compatibility, continuous coefficient
transport and Hilbert-90 isomorphism provide exactly the requested import.
Layer 8 supplies the low-degree cups. The generic Chern construction stays
with M.8's requested early prefix, requiring M.7; the unsplit M.8 also
requires R.7 and D.2 and is not silently imported into HB.2.

Checked the finite-field maps in K3BlochGroups V.5, V.3's CGZ convention
comparison, V.4's configuration targets, V.2's number-field Milnor import,
and the actual `K2SymbolsBrauer:T.2:symbols/milnor-number-field` statement
in its T.1 packet. The latter retains G-Bass-Tate. Its arithmetic proof
rescope after T.7 avoids adding a cycle into all of T.2:symbols. Checked
QM.0's q-Pochhammer and Andrews–Gordon contracts, QM.1's eta law, P.1's
classical-polylogarithm target and HB.4's already-owned Andrews–Gordon
acceptance theorem. The HB.5 request assembles the latter rather than
duplicating it.

The reviewed HB.2 library audit identifies no existing implementation of
these four new targets. The existing power-class and Kummer APIs are used,
not re-planned. The eight proposed edges were inserted sequentially into
the extracted stage graph after checking for reverse paths; none creates
a cycle. The after-split-only M.8 request is correctly excluded from
that edge list.

The four confirmed red-team findings are handled as follows:

| Finding | Assessment |
| --- | --- |
| RT-AREA-ktheory-2/2 | Unconditional scalar two is downstream at HB.5; HB.4 is not made an HB.2 prerequisite. The actual CGZ Theorem 7.4 and Andrews–Gordon supplier are identified. |
| RT-AREA-ktheory-2/13 | Import actual V.5 finite-field comparison maps. The supplier correctly inverts the characteristic for unstable homology; it does not repeat the false blanket integral order q²−1 assertion. |
| RT-AREA-ktheory-2/18 | One generic finite-Chern/product owner, with the early M.8 split explicitly requested and retained as a gap. |
| RT-AREA-ktheory-2/19 | Import the existing single Bass–Tate statement and its original-proof gap; identify arithmetic inputs without duplicating the theorem or creating a T.7→T.2 cycle. |

There is one new planet, the named KMS identity. With five retained parent
planets and the scalar-two landmark rescoped to HB.5, the proposed HB.2
selection has six. Applying that parent landmark rescope is a maintainer
assembly obligation; this review did not mutate the parent packet.

## Source findings and versions

All five independently downloaded PDFs match the packet's recorded hashes.
Public texts read are [published CGZ](https://math.uchicago.edu/~fcale/papers/CGZ.pdf),
[published GZ](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf),
[Hutchinson 2013 v2](https://arxiv.org/pdf/1107.0264v2),
[Hutchinson 2024 v4](https://arxiv.org/pdf/2104.14413v4), and
[Soulé's author-hosted thesis transcription](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf).
Published GZ pp.236–237 were also rendered and inspected visually.
The Hutchinson and Soulé provenance is kept distinct from a published
version of record. The J. Algebra publisher page refused full access
(HTTP 403); the inherited E14 comparison remains scoped to arXiv v4.

| Finding | Independent verdict |
| --- | --- |
| EHB2.1 | Confirmed Gaussian numerator sign; the preceding recurrence gives Y−X. |
| EHB2.2 | Confirmed missing Gaussian factor 1/√n, wrong nth-power eta prefactor and opposite exponential sign for the displayed B. |
| EHB2.3 | Confirmed wrong leading constant from discarding q-dependent shifts. Its discrepancy is (1−X)/(1−YZ); changed `gap` to `error`. |
| EHB2.4 | Confirmed phase misprint: ζ^n=1 is not μ^n. The explicit finite-product/Dedekind formula fixes it. |
| EHB2.5 | Added and confirmed: the second reference to (56) in the p.236 rational-function paragraph should be (55). |

The four supplied findings now carry this job's independent verdicts;
the fifth carries its own confirmed verdict. Searched the author
publication index, arXiv abstract and correction/erratum search results;
no existing correction was located. No message was sent to the authors.
The inherited E14 was re-read, not copied into a competing source-issue
record or edited in the parent packet.

Finite-product checks verified the Dedekind phase for every primitive root
of orders 3,5,7,9. At nonreal parameters near the selected base point,
Ramanujan product evaluations for ε=.02,.01,.005 gave relative errors
approximately .008908,.004445,.002220 for n=3 and
.015230,.007590,.003789 for n=5 against the corrected Gaussian constant.
These support the normalization checks, not uniform tail proofs.

## Suggested Lean file and validation

The finite-expression signatures agree with the packet; all eight API names
and four test names occur in the suggestion. The two actual Bloch/K-theory
comparison signatures remain honestly unstated because their supplier types
are absent. There are no proposition-valued stand-ins. Changed the deprecated
Complex import to `Mathlib.Basic.Complex.Basic`.

The full `lean-check` attempt stopped because the existing shared build
lacks the `TauCeti.Algebra.Group.PowerClassGroup` object file. Its Mathlib
checkout is at the pin; its Tau Ceti checkout is different. No build,
dependency update, cache fetch or checkout change was performed. The
Mathlib-only extraction through `kms_oddOrder` elaborates with only the
expected `sorry` warnings. This does not validate the full file or its Tau
Ceti power-class example. `implementationStatus` remains `unchecked`.

Validation: `python3 scripts/check_blueprint.py` on the corrected packet;
packet/source-issue schema and suggested-name parity; independent algebraic
and numerical checks above; and the stage-edge reverse-path audit. Upstream
specification examples read were AdicSpaces and GrothendieckEulerForms,
with ProfiniteCohomology read for the actual Kummer supplier.

## Handoff to the orchestrator

Give the revision job the reader path in its editable deliverables and apply
the four precise corrections above. Align its provenance with the reviewed
packet, then obtain the normal independent revision review. Preserve the
analytic exports, V.4 map, early M.8 split, source-sign comparison and
Bass–Tate proof contracts; their unimplemented status is not a reason to
replace the sound planning targets by unsupported closure claims. Apply
the downstream scalar-two and landmark rescope through the family assembly.
