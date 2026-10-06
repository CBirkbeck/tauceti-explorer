# BP-K3BlochGroups--V.4 handoff

Worker: Codex, session `codex-n9gXQ0`. Issue #6384. This is a complete
**target-level planning pass**, with V.4 coverage **planned**, not closed.
Implementation status remains unchecked throughout. No second job was claimed.

## Delivered

The packet adds 16 nodes (11 theorems, 5 constructions), with 25 API items and
17 unit tests. It explicitly imports and maps all 36 accepted parent V.4 targets,
without copying their identifiers into new nodes or editing the parent. The issue
remaining-work description predates the parent’s separate cross-ratio,
degree-three-generation and e-detection nodes; their additional proof interfaces
are the refinements here. The reader is approximately 7,300 words and agrees with
the packet. The suggested file gives all new constructions, API names, tests and
named theorem prototypes against actual baseline types.

Stability is decomposed through scalar homology vanishing, affine-block homology,
independent-vector chains, top-homology coinvariants, iterated connecting maps,
the ordered Milnor map and its retraction, the frame-algebra split and simultaneous
spectral-sequence induction. The retraction precedes the induction, so no use of
stability to prove itself is introduced. The degree-three quotient uses coefficient
+1 and yields torus/old-rank generation. Cross-ratio field change imports the
parent convention cr(0,∞,1,x)=x.

The detector is a composite through torsion after extension to an algebraic
closure. Its target is the weight-two Tate twist, naturally modeled by Tor of
roots of unity, not their ordinary tensor product. The finite Chern square has
c₂(λ⊕λ⁻¹)=−c₁(λ)² and e=−c₂,₄. The Bott-product restriction m≢2 mod4 is handled
for order-two torsion through m=4. The closure torsion comparison imports the
existing V.2 Milnor injectivity and T.2 unique divisibility, with the baseline
injectivity of divisible abelian groups.

The packet cites 17 baseline declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The torsion reference is the indexed
CommGroup.torsion, whose generated additive counterpart AddCommGroup.torsion
was read and elaborates; generated additive names are absent from this index.
Zero new planets are selected: the accepted parent already has six, retained by
import. The packet proposes three V.4 sublayers before adding any planets.

## Remaining closure work

Seven gaps remain, fully specified with consuming nodes in the packet:

1. **General homology supplier closure.** LHS with coefficients, the resolution
   double-complex spectral sequence and finite convergence/edges, central-action
   annihilators, elementary-abelian mixed exterior/symmetric homology, integral
   UCT detection, products/colimits, cyclic cohomology cup-periodicity and natural
   locally-cyclic H₃–Tor transition maps. Existing Mathlib spectral sequences,
   total complexes, Shapiro and cyclic resolutions are foundations, not missing
   definitions. Extend H.1 as Part II, importing upstream AlgebraicTopology
   stage5 products/Künneth and stage6 cohomology.
2. **Unstable SL₂ Steinberg input.** Su84’s θ well-definedness uses the unstable
   H₂(SL₂) symplectic-symbol coinvariant presentation. Stable Matsumoto/UCE does
   not supply it. Acquire the cited proof and supply exact T.2 Part II nodes.
3. **Algebraically closed finite-coefficient K-theory.** KVI1.3.1/1.4 state the
   needed even divisibility/Bott/Bockstein calculation; its original proof is
   not decomposed here. The existing henselian finite-residue-field L.2 target
   is insufficient. Extend L.1/L.2 as Part II. Milnor injectivity is already
   imported from V.2 and must not be planned again.
4. **Early Chern supplier.** Split the finite-coefficient Tate/Kummer/Whitney/
   Bott/Hurewicz/Bockstein interface adjacent to M.7. Importing all of M.8 gives
   M.8→BorelRegulators:R.7→Polylogarithms:P2→V.4. Keep this explicit gap until
   exact early supplier nodes eliminate that cycle.
5. **GL₂ d³ calculation.** Su91 Lemma2.4 p222 explicitly omits the computation.
   Obtain or supply the actual chain calculation with the parent signs/indexing.
   Merely obtaining the original paper does not close it.
6. **Inherited ψ₃/symmetric-group proofs.** Read Su91 §§3–4 completely and check
   the chain map, torus boundary, rank-two kernel and Dupont–Sah comparison.
   Acquire the separate GL₃ source [184] for the symmetric/alternating image and
   its 2-primary computation; Su84 [183] is a different paper. Retain the parent
   monomial Künneth summand gaps.
7. **Inherited plus-construction/enhanced Tor closure.** Supply exact early BPQ,
   low stable stems/η³, homology-to-AHSS and extension-class inputs. Ordinary Tor
   injection alone does not prove the enhanced extension nonsplit. For Q the
   ordinary detected group has order2 and the enhanced kernel order4. Preserve
   infinite-field scope; V.5 owns the finite-field route.

Six precise requests cover H.1, upstream AlgebraicTopology stage5, H.6, T.2:symbols,
L.2 and M.7. The upstream request applies its existing products/Künneth/Serre
interface; it asks for no change to upstream. H.6 supplies its existing
finite-coefficient Bockstein remit. Part II/split proposals address the remaining
scope extensions without creating local substitutes.

## Sources and qualifications

Public sources are identified by URL, edition, hash, access date and read sections
in the packet. Su84 is the Russian version of record, Trudy165 (1984), pp188–204;
§§1–3 were read, including the formulas checked visually. It is [183] in Su91,
not the Springer stability paper or the separate GL₃ [184]. Su91’s public published
English scan was read in §2 pp221–223 and §5 pp233–239, with critical scan formulas
checked visually. Unread §§3–4 proof inputs are named above. K-book author copies
V §11/Exercise11.5 and VI §§1–2/5.19–5.20, including Definition1.7 and
Proposition1.7.1, were read. The original proofs of the algebraically closed
K-theory calculation and unstable SL₂ presentation remain missing.

Two source issues are recorded: the positive c₂ sign in the Chapter V author-copy
Exercise11.5 hint (the corrected negative sign leaves its isomorphism conclusion
intact), and Su91’s acknowledged omission of the d³ proof. The sign finding is
scoped to the hashed author copy, not an uncollated print edition. The author’s
linked errata URL returned404; no correction was located in the recorded searches.
No claim is made that either stated theorem is false.

Two full upstream documents were read: Algebraic topology, and Representation
theory/Induction and restriction. The reviewed AUDIT-29V4, roadmap extract, parent
packet/coverage, relevant supplier nodes and stage links were inspected. No
upstream roadmap, application, atlas data or other packet was edited.

## Validation and resumption

- `python3 scripts/check_blueprint.py research/blueprint/packets/K3BlochGroups--V.4.json`:
  **0 errors, 0 warnings** with the pinned declaration index.
- The source-issue and source-version validators accept the embedded records.
- `lean-check research/blueprint/suggested/K3BlochGroups--V.4.lean`:
  **exit0, only 66 expected placeholder-proof warnings**, at pinned Mathlib;
  no build, cache download or language server was started. Available memory was
  above20GB before every run.
- API/test name correspondence, imported-target completeness, new-id uniqueness,
  source excerpt lengths, allowed paths and whitespace were checked.

The Lean file is a signature prototype. Future supplier objects are explicitly
interpreted data parameters, never empty proposition-valued stand-ins. Conditions
without supplier syntax are commented and omitted as the protocol prescribes.
The definitive theorem statements and all hypotheses remain in the packet and
reader; schematic Lean conclusions do not claim the arbitrary parameters obey
those theorems. Full internal-sum/product, spectral-sequence convergence and Chern
normalization clauses need the exact supplier API before implementation.

Independent review should check the scalar-only strengthening of Su84’s
all-diagonal affine-block hypothesis, the shifted frame indexing, the simultaneous
induction, ordered θ normalization, closure torsion identification, Tate transitions
and finite-level Chern sign. A follow-up resumes the seven closure chains above,
not another definition of the parent configurations, cross-ratio or ψ maps.
All necessary source URLs and mathematical resumption notes survive in these
four deliverables; scratch downloads and logs are deleted at submission.
