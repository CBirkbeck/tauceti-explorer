# Independent review of ArithmeticKTheory N.5

**Verdict: accepted after corrections.** Job `REV-ArithmeticKTheory--N.5`, issue
#6428; reviewer Codex, session `codex-aqqeHF`, 6 October 2026. The planning
session was `codex-mDuyQK`; this reviewer did none of that work.

This accepts a complete **target-level planning pass**, with coverage **planned**.
It does not close the stage or establish any Lean proof. The exact open supplier
contracts, unread original Harris–Segal proof and inherited dependency cycle
remain visible. None creates an unrecorded contradiction in the six new nodes.

## Counts and scope

| Item | Reviewed result |
| --- | --- |
| New nodes | 6: 3 comparisons and 3 theorems |
| Node verdicts | 5 corrected; 1 verified; none added or unverifiable |
| Retained N.5 imports | 7 from the accepted N.1 packet, retaining their ids |
| New definitions/constructions, API items, definition tests | 0, 0, 0 |
| Inherited definition API/tests | e-invariant: 5 API items, 4 tests |
| Direct baseline declarations | 6 confirmed; none removed or replaced |
| Planets | 2 new + 4 inherited = 6 on N.5 |
| Requests/gaps | 9 precise requests; 5 recorded gaps |
| Coverage | 1 planned stage; 0 closed stages |
| Source issues | 0 new; 9 inherited references checked for their use here |
| Suggested Lean | 1 theorem and 3 acceptance examples; 4 `sorry` warnings |

Only the packet, suggested file, this report and this job's handoff are changed.
The reader was inspected, including both red-team responses; it is outside the
issue's editable deliverables. The corrections preserve its mathematical
statements and its three-example/four-warning description.

## Public source verification

The three downloaded author copies match every SHA-256 in the packet. Access
date: 6 October 2026. Locators below distinguish printed and PDF pages.

| Source | SHA-256 | Principal passages checked |
| --- | --- | --- |
| [Weibel, *The K-book*, 29 August 2013 draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` | IV.2.5–2.8 and Exercise IV.2.6; V.6.8–6.8.1; VI.1.4–1.7.1, VI.2–3.1.2, VI.8.2–8.3, VI.9.3–9.5 |
| [Weibel, Handbook I.5](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf) | `6c6368a61982eca8b05a44d521088c61d9c890a02454766a0ff5a6c1c6c831fe` | §§5.3–5.4, §5.7/Theorem 73 and §5.8; Proposition 42/Remark 45 as supporting coefficient checks |
| [Rognes–Weibel, JAMS 13 (2000)](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf) | `9d770c079313ccc26f29da641d301269edf12985f122fd107ab201f086e8f446` | §1 after Example 1.6, p. 8; Theorem 5.6 and proof, pp. 28–29; Theorem 6.7 and proof, pp. 32–33; Theorem 6.9, pp. 33–34 |

Every new node's literal excerpt occurs in its cited passage. The K-book's
printed pages are eight below its combined PDF page numbers. The real torsion
table on printed p. 475/PDF p. 483 and Rognes–Weibel p. 33 were also inspected
as rendered pages to check the degree columns, multiplication-by-two map and
extension formula.

### Node checks and all corrections

1. **Primary Bockstein/localisation — corrected.** IV.2.5, printed p. 280,
   gives the UCT; **Exercise** IV.2.6 is on printed p. **284**/PDF p. **292**,
   not p. 283/291. Corrected that locator. It is distinct from **Example**
   IV.2.6 on p. 281. Finiteness of the positive even group is used for
   `R = O[1/ℓ]`, never for the number field. A finite group tensors to zero
   with a divisible group. The odd localisation isomorphism and natural
   coefficient maps then give the asserted primary comparison, including
   real fields at two. The Q_ℓ/Z_ℓ extension of H.6 remains a requested input.

2. **e-invariant/descent edge — verified unchanged.** Rognes–Weibel p. 8
   explicitly factors the H⁰ edge through the Bockstein and restriction to
   the algebraic closure. K-book VI.1.6–1.7.1 supplies the torsion description
   and equivariance. Using one coherent Bott convention identifies the maps.
   The vanishing H² term has twist `j+1`, and the isomorphism conclusion is
   restricted to odd ℓ or totally imaginary fields at two. Real fields retain
   the equality of maps with their defects. Neither exceptionality alone nor
   a choice of a cyclic generator is substituted for that argument.

3. **Diagonal extension normal form — corrected.** The general group-theory
   assertion follows from an elementary presentation, motivated by the final
   paragraph of Rognes–Weibel's proof of Theorem 6.7. Replaced an implicit
   basis-existence step with an explicit complement: fix a coordinate v₀;
   vectors zero at v₀ complement the diagonal, since
   `a = a(v₀)d + (a − a(v₀)d)`. A relation `m x + ι(c) = 0` first forces
   `m = qw`; the v₀-coordinate then forces q even and c zero. This proves
   the normal form and exact order, with no extra lemma node at target level.
   Added the packet's lift-independence conclusion to the Lean theorem.
   Strengthened the existing two-coordinate example to assert
   `E ≃+ ZMod 16 × ZMod 2` and order 16 under the actual extension hypotheses,
   while retaining the split group's exponent-eight contrast. There are still
   three examples, including the specified cyclic quotient's nonsplitting.

4. **Real e-invariant extension — corrected.** Rognes–Weibel compare extensions
   along a real embedding on p. 33. Applying the same natural comparison at
   **every** real embedding gives all nonzero coordinates, rather than merely
   one nonzero coordinate or a cardinality. Suslin's real-to-complex map is
   multiplication by two in degree 8k+3, as K-book Table 3.1.1 confirms.
   Each pushout is consequently the specified pullback, and every coordinate
   of the Ext class is one. Adjoining odd-primary cyclic factors preserves
   this mod-two class. Clarified that the pushout uses the group projection
   `(Z/2)^V → Z/2` at v, rather than the ambiguous notation `V → {v}`.
   Added the direct N.4 finiteness prerequisite for W and corrected the
   Theorem 6.7 locator to pp. 32–33. Naturality concerns the sequence and real
   coordinates; it supplies no natural cyclic lift or free basis.

5. **e-invariant kernel/cokernel — corrected.** Checked the four positive even
   coefficient rows in VI.9.4 and the integral consequences in VI.9.5. Indexing
   by `n+1 = 2j` gives the stated odd-degree table. In degree 5 modulo eight,
   dyadic source torsion is zero while W's dyadic subgroup has order two.
   Replaced the prerequisite defining exceptionality with the actual
   `N.4/two-primary-w-invariant` theorem, and added
   `N.4/finiteness-of-the-w-invariant` for primary reassembly. The n ≡ 1
   row begins at n = 9; neither K₁ nor coefficient degree zero is claimed.

6. **Edge-normalised Chern torsion — corrected.** Handbook §5.4, p. 153,
   defines the first Chern map by Dwyer–Friedlander comparison and the edge.
   Theorem 73 supplies the cd-two arithmetic context; it does not itself
   establish the unrestricted real-field formula. That formula uses the
   precisely requested coefficient/connecting square, with the preceding
   real edge calculation. Replaced the direct cyclotomic formula prerequisite
   (whose supplier statement is **odd-prime only**) by all-prime N.4 finiteness.
   A nonzero invariant in Q_ℓ(j) would trivialise its character and make
   Q_ℓ/Z_ℓ(j) entirely invariant, contradicting finite W; this proves the
   required H⁰ vanishing also at two. Added direct N.3 finite generation for
   the completion argument. M.2 must still supply H¹ finite generation and
   rationalisation. The connecting map identifies W with **cohomological
   torsion**, and only the cokernel into that torsion is computed. Raw higher
   Chern factorial/sign conventions remain a separate M.8 request.

No node was added, no baseline citation changed, and no published-source error
was newly asserted. All six implementation statuses remain `unchecked`.

## Pinned baseline

Read the actual Lean source at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; confirmed the Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`. The suggested file imports only the
pinned Mathlib modules and uses no later Tau Ceti checkout declarations.

| Packet reference | Source and statement checked |
| --- | --- |
| `CommGroup.primaryComponent` | `Mathlib/GroupTheory/Torsion.lean`, lines 444–453: subgroup killed by a power of p; its `to_additive` form is `AddCommGroup.primaryComponent`, with p prime in the arithmetic use. |
| `ZMod` | `Mathlib/Data/ZMod/Defs.lean`, lines 142–144: modulus zero gives ℤ, positive modulus gives `Fin`; the extension theorem retains w > 0. |
| `MonoidHom.ker` | `Mathlib/Algebra/Group/Subgroup/Ker.lean`, lines 233–243: kernel at one, generating `AddMonoidHom.ker` at zero. |
| `MonoidHom.range` | Same module, lines 63–68: subgroup image of a group homomorphism, with the additive version generated. |
| `ZMod.castHom` | `Mathlib/Data/ZMod/Basic.lean`, lines 331–337: `m ∣ n`, a target ring of characteristic m, and a ring homomorphism from `ZMod n`. Taking the additive hom gives reduction Z/16 → Z/8. |
| `ZMod.addOrderOf_one` | Same module, lines 121–123: `addOrderOf (1 : ZMod n) = n`; no hidden nonzero hypothesis. |

The multiplicative reference spellings for primary component, kernel and range
are retained because their source declarations carry the additive generation.
Their conventions supply the exact additive objects used here. The suggested
file elaborates the additive kernel/range, ZMod and reduction-map signatures.

## Closure, inheritance and ownership

Read the seven N.5 nodes and their accepted review in the N.1 packet. Their
localisation, structure and e-invariant outputs are imported without new ids.
The inherited e-invariant's API exposes the map, primary restriction,
naturality, weight-one identity and finite-field case. Its four tests distinguish
finite-field bijectivity, the noninjective Q/K₃ case, separably closed Suslin
torsion and the weight-one identity. No new definition requires a parallel API
or definition tests in this follow-up. Arithmetic signatures that the pinned
carriers cannot express remain explicitly omitted in Lean.

Checked the actual supplier statements: N.3 finite generation/ranks; N.4 W,
finiteness, odd-prime and two-primary formulas; L.1 finite-field groups,
coefficients, products, Bott, transfer and completion; L.2's restricted local
Suslin statement; H.6's coefficient and Milnor nodes. Read M.2/M.7/M.8 and
RT.4:topological stage scopes where no finer supplier node exists. The packet
correctly requests general Suslin equivariance, real comparison/filtration,
Q_ℓ/Z_ℓ coefficients, continuous cohomology and the edge square; a proposed
supplier name is not used as an existing or reserved node. Its safe-modulus
guard for the inherited Soulé proof avoids the overbroad unreviewed L.1 product
clause, and retains the K.7 boundary/projection-formula request.

The six new nodes are acyclic, with no full M.8 prerequisite. The inherited
chain N.5 → M.8 → R.7 → P.2 → V.3 → V.2 → N.5 is explicitly a gap, together
with the owning V.2 correction. This review does not certify the full union
globally acyclic. All five audited N.5 targets are assigned to the inherited
nodes, these map/extension nodes and exact requests. **Planned**, rather than
closed, is the correct coverage status.

The reviewed library audit reports these higher-K targets absent and identifies
M.7 dyadic descent and M.8 Chern theory as shared inputs. The new packet consumes
those owners, rather than rebuilding their theories. V.5 must import arithmetic
structure from N.5 and certified examples from N.8. Baseline real/complex-place
arithmetic and Tau Ceti's K₀ work are not replanned as higher K-theory.

## Red-team and inherited source corrections

Both confirmed findings are correctly handled in **both packet and reader**:

- **RT-AREA-ktheory-1/3:** the real Suslin theorem and every real-place extension
  map are explicit M.7 requests. The missing KO/BO, real Bott and coefficient
  complexification foundation is a requested RT.4:topological scope extension.
  Existing complex ku/KU and algebraic Clifford periodicity are not treated as
  real topological K-theory. The correction of integral BO degree 8k+3 to
  **8k+4** is preserved.
- **RT-AREA-ktheory-2/22:** V.5 imports N.5/N.8 arithmetic outputs and retains
  its Milnor/decomposable and indecomposable calculations. The proposals avoid
  duplicate ℤ, ℚ and ℚ(i) K₃ calculations and record the V.2 cycle correction.
  Their application remains with the owning packets/orchestrator.

The packet's own `sourceIssues` is empty, so there are no new findings needing
an in-place verdict. The nine inherited references were checked against the
same draft and their use here is sound:

| Reference | Checked correction/use |
| --- | --- |
| ArithmeticKTheory/E6 | V.6.8.1, p. 413: coefficient targets and boundary `∂s`, retained in the inherited Soulé interface. |
| ArithmeticKTheory/E10 | VI.2.1.3, p. 470: integral BO/BU degree 8k+4, distinct from torsion-map degree 8k+3. |
| ArithmeticKTheory/E13 | VI.2.3, p. 471: ℝ itself has cyclic absolute Galois group and is nonexceptional; real number fields remain exceptional. |
| ArithmeticKTheory/E15 | VI.8.1, p. 513: positive even finiteness belongs to S-integers, not the field. |
| ArithmeticKTheory/E17 | VI.8.2 proof, p. 513: residue fields are O/𝔭 before inversion, not R/𝔭. |
| ArithmeticKTheory/E20 | VI.9.4, p. 519: dyadic coefficient tables use the two-primary w, with coefficient degree zero excluded here. |
| KTheoryFiniteLocalFields/E3 | IV.2.7, p. 281: coprime coefficient factors q₁ and q₂ are distinct. |
| KTheoryFiniteLocalFields/E4 | Example IV.2.6, p. 281: the even index is m, not the printed n. |
| KTheoryFiniteLocalFields/E10 | VI.1.4 proof, pp. 465–466: the finite local coefficient calculation has an odd class which dies in the colimit; the final Suslin conclusion is retained without the false transition-isomorphism step. |

These remain owned by their original packets; no duplicate errata or original
review records were edited. The unread Harris–Segal original §3 remains a source
gap, rather than being replaced by its K-book quotation.

## Validation and orchestrator follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.5.json`:
  **0 errors, 0 warnings** after the corrections and review object.
- `lean-check research/blueprint/suggested/ArithmeticKTheory--N.5.lean`:
  **exit 0**, exactly four `declaration uses sorry` warnings, no other warnings
  or errors. Available memory was above the required 20 GB. This validates
  signatures only.
- `git diff --check`: clean.

No question blocks acceptance. The orchestrator/owners should apply the proposed
real KO/BO scope extension, plan the named M.7 interfaces, discharge H.6/M.2/K.7
contracts, obtain Harris–Segal §3, and apply the V.5 ownership and V.2 cycle
corrections. Until then the stage remains planned with its five recorded gaps.
