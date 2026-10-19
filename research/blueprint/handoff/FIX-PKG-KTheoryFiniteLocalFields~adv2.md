# Checkpoint: finite and local field K-theory package repair

Issue #11140; job `FIX-PKG-KTheoryFiniteLocalFields~adv2`; Codex,
session `codex-i4wMka`, 19 October 2026. Disposition: **needs_changes**.
This is a checkpoint because the remaining supplier order requires maintainer
routing outside the authorized deliverables. It is not an independent review.
The mathematical repairs below and all validation are complete for this change.

## Remaining blocker and exact continuation

The issue explicitly authorizes GeneralAlgebraicKTheory #1212, position 2,
§§13.8a–c. That authorization is consumed, and the finite-field/hermitian cycle
is gone: GeometryOfNumbersAndQuadraticArithmetic #851 imports #1212.

Finding 7 additionally requires an authorized supplier order or bundle.
[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) restricts packages
to existing Tau Ceti roadmaps and their own or earlier authorized bundles/tiers.
`upstream/CaraianiNewton.md` contains no assignment of KTheoryFiniteLocalFields,
MotivicEtaleKTheory or RefinedTraceMethods. The focus list includes them but
supplies no order. At the checked upstream heads, RefinedTraceMethods and
MotivicEtaleKTheory remain atlas-only. The residual K2SymbolsBrauer and
HermitianKTheoryOfPoincareCategories contracts also need inclusion in that
supplier audit. A roadmap's presence in the atlas does not itself establish
that it is an allowed earlier package.

The maintainer needs to register the relevant earlier suppliers or an authorized
bundle/split. The issue permits edits only to this package's README,
Suggested.lean, review.json and this handoff; it does not permit rewriting the
programme order or the other roadmaps. Do not hide this by duplicating their
foundations here. Clarification was requested during this run; none had arrived
when this checkpoint was prepared.

The previous handoff's M.7/rigidity description is obsolete. The current
MotivicEtaleKTheory package, introduced at atlas commit `5ebc53629`, has actual
coniveau in Layer 8, field descent/comparison in Layer 10, real applications in
Layer 11 and regulators in Layer 12. Its §11.1 imports K-theoretic henselian
rigidity here; its field comparison §10.4 does not import that real application.
Cohomological rigidity in its §§1.6,5.6 is a separate input. The repaired README
uses these actual interfaces. A mathematical layer schedule to register is:

1. GeneralizedCohomology's existing spectra/KU; #1227's plus and coefficient
   comparisons; #1212's standard finite-field comparison; #1229's exact
   representation and higher-operation interfaces.
2. The finite-field refinements, early universal Chern/Lang construction and
   henselian rigidity in this roadmap's Layers 0–2.
3. The foundational trace interfaces RT.1–RT.3 before the logarithmic
   specialization in Layers 4–5; arithmetic trace values here may feed later
   trace applications. Absolute log-Witt initiality is §5.2a here.
4. MotivicEtaleKTheory's foundational Layers 1,4–8,10 before the local comparison
   §6.6 here. Independently, §2.1 here precedes its real comparison §11.1;
   its real/regulator applications are not inputs to §6.6.
5. #1212 → #851 §§6.8a–6.10 → the hermitian applications §§1.7,6.13 here.

This is a proposed mathematical schedule, not a self-authorized programme change.
Resume by locating the maintainer's order decision and reconciling all remaining
atlas-only suppliers with it. Then recheck the frozen interfaces below and run
validation before changing review.json to accepted. No new proof construction
is needed merely to replace the obsolete M-number references.

## Finding-by-finding disposition

| Finding in REV-PKG-KTheoryFiniteLocalFields~adv | Repair and result |
| --- | --- |
| 1. Completion and continuous Adams | Retain §§0.1–0.2's compact augmentation-kernel lim¹ and continuous unit-Adams targets with their APIs/checks. Import #1212's `finiteField_adamsInput`, `finiteGroup_KU_completion`, `finiteField_brauerLift`, `finiteFieldKGroups` and `finiteField_K4_vanishing` by actual target id. Update its frozen head. KU and telescope carriers belong to GeneralizedCohomology. No duplicate Green/standard Brauer/Quillen proof is restored. |
| 2. Multiplicative Eilenberg–Moore | Retain §0.3's simply connected, degreewise finite-type field-coefficient pullback target, two-sided bar/Tor product, convergence, edge maps and checks. The generic filtered-spectrum construction is not cited as its proof. Correct the current homotopy supplier's section numbers separately. |
| 3. Absolute logarithmic Witt | Retain §5.2a's arbitrary-prelog ℤ_(p)-algebra initial object at odd p, level-one absolute differential comparison, standard filtration and operator API. It is distinct from relative CR.4.6. Recheck HM03 §§3.2.1–3.2.4; fix HM04's introductory page range to pp.1–5. |
| 4. Early Chern/geometric comparison | Retain §1.8's independent universal-equivariant/Moore-Hurewicz construction, signed finite-field edge and exceptional additivity; retain §1.9's actual Lang/classifying comparison. Replace stale motivic M.7/M.8 references with the actual later interfaces and distinguish them from integral motivic Chern classes on smooth schemes. No rigidity or motivic K-descent is imported into the early construction. |
| 5. Geisser–Levine and approximation | Recheck and retain §5.17's field p-torsion-freeness/coefficient comparison and smooth Zariski-sheaf comparison, distinct from BGK. Its finite-length Popescu diagram precedes the controlled R-limit. SchemeAndStackFoundations §0.15 is an existing upstream export, not a new Popescu construction here. |
| 6. Space splitting | Retain §§0.4–0.5,6.12's realization, transfers/completion, actual root retraction, local Iwasawa module, spectrum equivalence, positive comparison and valuation fibre. Correct the representation-ring carrier in the Burnside argument, add the modular Cₚ control, and spell out split-epimorphism cancellation proving root-map multiplicativity/tower/Galois compatibility. The final splitting theorem remains an output. Specify finite coefficient finiteness for the completion step, without asserting finite generation of integral local K. |
| 7. Authorized dependency order | **Unresolved** as described above. Newly available #1227 and #1229 remove two former atlas-only supplier problems; current motivic layer names remove the old alleged field-comparison cycle. Neither fact supplies the missing programme assignment for the remaining atlas suppliers. |

The new operation contract also repairs an unstated-export assumption:
SchemeKTheoryOperations §6.3.4 states Frobenius=Adams on representation rings;
§6.4 states genuine-map universality and positive-degree λ/Adams identities.
Section 1.5 now derives `frobenius_eq_adams` and
`perfect_positiveK_uniqueDivisible` explicitly from these. The latter is stated
for every perfect commutative 𝔽p-algebra, as supported by K-book IV.5.6, not only
fields. The perfect characteristic-two application consumes this local target.

## Supplier and library audit

Read the reviewed library audit for all seven original layers. The read-only
current TauCetiRoadmap checkout was at `0d144d044dacebca17b654695b6f1ad58f159b27`;
current Tau Ceti was at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
No Lake command was run in either checkout.

| Supplier | Frozen evidence and consumed interface |
| --- | --- |
| GeneralAlgebraicKTheory #1212 | `67c1f583452d1a6cf255f200a2261340490fc894`, §§13.8a–c, named finite-field targets above. Integer operations used here are on BU; nonunit integer operations on periodic KU are not assumed. |
| StableHomotopyKTheory #1227 | `8daae80bf930bc96912f4ce2c378cff886cd5626`, Layers 1–3, §§7.1–7.11,7.13–7.18,7.28,7.30. The old references to completion extension §7.13 and Browder §7.33 were stale; the current targets are §§7.11 and7.30. |
| SchemeKTheoryOperations #1229 | `bf5798b12eadc61f008f53a16d162c0d64804e49`, §§6.3.4–6.4: general exact representation rings, Frobenius twist, Hiller lifting/uniqueness, λ-additivity and ψᵏ=(−1)^(k−1)kλᵏ in positive degree. |
| AlgebraicKTheory #1142 | `4c951ced56bd5eaeae86ca3d2a474c503cc3ab40`, A2/A4 determinant and commutative semilocal SK₁, A5 Matsumoto/finite-field K₂. Field norm/valuation comparisons remain consumers here of categorical transfer/localization, not claimed matrix-only exports. |
| GeometryOfNumbersAndQuadraticArithmetic #851 | `01c64f0cc5f154a3d190697951ead2fffc2af693`, §§6.8a–6.10, including `finiteEvenFieldHomotopyLimit` and its explicit #1212 input. |
| CrystallineCohomology #857 | `f1f560c452853918c071460d83fc5f954c155861`, CR.4 classical/relative Witt theory and log differentials; no identification with absolute mixed-characteristic Witt initiality. |
| SchemeAndStackFoundations on main | §0.15 at `c785fa3b983754f0dbcc49492d92fd770e3adba6`, `popescu_desingularization` and `popescu_colimit_of_geometricallyRegular`. |
| GeneralizedCohomology on main | G2 spectra and monoidal homotopy theory, G3.4 telescope/Milnor, G3.8–G3.9 homotopy limits/completion, G5.4 represented KU/BU/Bott. Read the actual current contracts; these are not newly planned here. |
| MotivicEtaleKTheory atlas package | Atlas `5ebc53629`, §§1.5–1.6,4.4,6.6,7.4–7.5,8.1–8.7,10.3–10.4,10.6. §11.1's reverse rigidity citation is explicitly separate. No upstream roadmap/order assignment found. |
| RefinedTraceMethods atlas reader | RT.1–RT.3, HH/cyclotomic/trace/relative comparisons, before their later arithmetic applications. It has no upstream package at the checked heads. Its stronger henselian Part II is not silently supplied by ordinary nilpotent relative trace. |

At the pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
`RepresentationTheory/RepresentationRing/Basic.lean` explicitly makes `repRing`
split K₀, and character injectivity is restricted to the finite algebraically
closed characteristic-zero setting. Current Tau Ceti additionally implements
exact field representation K₀ in
`RepresentationTheory/GrothendieckGroup/FDRep.lean`, with its monoidal exact
structure and `ExactK0.fromSplitRingHom`. The README consumes this current
implementation for field representations and #1229 only for the general-ring
extension. No declaration depending on this newer carrier was added to the
pinned Suggested.lean. The existing dimension equivalence is retained by #check.

## Adversarial pass

This table covers every changed mathematical contract and the retained targets
needed to assess the seven findings. These are mathematical instance checks and
source checks, not a claim that the planned K-theory has been formalized.

| Statement/interface | Instances and calculation | Result/change |
| --- | --- | --- |
| Spectrum/coefficient ownership and current completion APIs | Identity tower, zero tower, ℤ with ×p, finite coefficient towers; m=1; K₂(𝔽₃;ℤ/2)=ℤ/2 although K₂(𝔽₃)=0. | Correct actual §7.11 extension; retain lim¹ and distinguish quotient from coefficient homotopy. |
| Integer versus completed Adams | u=1 is identity, u=−1 has degree-two/four weights −1,+1; u=p cannot preserve invertible Bott; ℤ₂× is not procyclic. | Retain unit-domain and continuity hypotheses; #1212 provides the BU integer input, §0.2 the unit completed refinement. |
| Compact augmentation uniqueness | G=1 leaves noncompact discrete rank ℤ; C₂ has I²=2I and compact kernel ℤ₂; ×2 on ℤ₂ need not be onto but has zero lim¹, whereas the discrete ℤ tower does not. | Retain both Milnor degrees and compact-kernel/constant-rank argument. |
| Eilenberg–Moore | Point over K(ℤ,2) gives Tor bidegree (−1,2), total degree1; identity pullback recovers X; BU×BU is degreewise finite type; S¹ fails the simply connected hypothesis. | Retain §0.3, including multiplication and convergence; no filtration splitting. |
| Standard finite-field import | q=2: K₁=0, K₃=ℤ/3; q=5: K₁=ℤ/4, K₃=ℤ/24; n=0 and defining-prime completion retain rank. | Imported once from exact #1212 targets. No q=1 pseudo-field case. |
| Character and exact representation carriers | Complex C₂ gives ℤ[σ]/(σ²−1). In characteristic p, Cₚ has only one simple module; a nonsplit length-two unipotent module has exact class2 but a different split class. | Scope ordinary character injectivity correctly; use exact K₀ in Burnside detection, with Maschke comparison only when licensed. |
| Low-degree suppliers/maps | K₁(𝔽₂)=0 while GL₂(𝔽₂) has nontrivial abelianization; determinant of a field unit is that unit; K₀ transfer for a quadratic extension is ×2. | Cite stable determinant/Matsumoto suppliers; do not infer finite-rank stability or positive-degree transfer surjectivity at degree zero. |
| Frobenius=Adams | 𝔽₄: squaring units is ×2 on ℤ/3, inverse ×2. On K₁, λ²[u]=−[u] and ψ²[u]=2[u]. | Derive via exact-representation identity and genuine-map uniqueness; the integer minus sign survives field characteristic two. |
| Perfect positive K unique p-divisibility | Perfect fields, zero algebra, perfect nonfield 𝔽p[x^(1/p^∞)]; imperfect 𝔽p(t) has no p-th root of t; multiplication by p on field K₀=ℤ is not onto. | General perfect-algebra statement, n>0; no assertion for every characteristic-p algebra or degree zero. |
| Restriction/transfer normalization | 𝔽₂⊂𝔽₄ on K₃: res is ×5 into ℤ/15, tr∘res=2 and res∘tr=1+4; d=1 gives identity. | Actual canonical maps retained, compatible cyclic generators remain choices. |
| Early Chern versus later motivic classes | Trivial representation and stabilization; 𝔽₇/mod3 weight2 gives nonzero negative Kummer–Bott; 𝔽₃/mod2 weight3 kills the class by2!; 𝔽₅ has nonsquare2 but square−1. | Keep signed factorial, correct unit choice and independent universal/Moore construction. Later regular/smooth motivic classes do not replace its arbitrary-ring scope. |
| Lang/Sp comparison | Rank1 inclusion is identity, rank0 excluded; q=3,5 transgressions8c₂,24c₂; Gₘ Lang map x^(q−1); disconnected constant group may fail surjectivity. | Actual map and prime-to-characteristic coefficients retained, no mere order/dimension substitute. |
| Absolute Witt initiality and filtration | n=1 absolute differentials; unit log structure recovers ordinary forms; canonical DVR log has dπ=πdlogπ; 𝔽p[x,y] has nonzero p-torsion dx∧dy. Fil⁰=whole, Filⁿ=0, quotient by Filˢ has length s. | Universal prelog scope retained, higher-form divisibility stays DVR-only, dV terms retained, no multiplicative index-addition assertion. |
| Geisser–Levine/Popescu | Perfect field positive p-coefficients vanish but K₀ survives; 𝔽p(t) has dlog t≠0; 𝔽p[[t]] is regular and not finite type; dual numbers are singular. | BGK distinguished from K comparison, sheaf statement distinguished from global sections, finite-length colimit precedes R-limit. |
| Current motivic field range | d=0 separably closed gives all nonnegative degrees; d=1 finite fields includes n=0; d=2 p-adic fields starts at n=1; real field at two has infinite ordinary cd₂. | Use actual §10.4 without the extra Tate–Tsen/Bott hypotheses of its separate periodic argument; do not route through Layer11. |
| Root retraction compatibility | f_Es=id and f_Ssf_E=f_S imply hf_E=f_S. Precompose multiplication with f_E∧f_E and cancel its right inverse; unit/tower/Galois identities cancel f_E. μ=1 is excluded. | Add the actual cancellation proof. Neither monoidality of Φ nor multiplicativity/infinite-loop structure of the original section is assumed. |
| Height-one modules and splitting | Zero/free modules, redundant resolution, one-relation fibre; cohomology is contravariant. KU^(i+2)=KU^i(−1), so ΣT has the required degree−1 twist. | Preserve Λ′ action and Bott twist; realize module equivalences rather than compare abstract homotopy-group tables. |
| Positive local comparison/completion | Tₖ has π₀=π₋₁=ℤₚ, so Tₖ∨ΣTₖ has rank2 in degree0; local K₀ has rank1. Integral higher local K is uncountable. | Keep τ≥1 comparison and restore rank separately; use finite coefficients/continuous étale finiteness, never finite generation of integral K. |
| Valuation space fibre | ℚ₃ has d=1 and leaves SU with no U factor; ℚ₅(ζ₅) gives k=g⁴ and order5 torsion. Valuation is primitive on d+1 circle directions; p=2 lacks this generator choice. | Retain actual circle sections and basis change, choice dependence and odd-prime restriction. |
| Tame coordinate definition and Lean direction/sign | Over 𝔽₅ unit/π gives2, reverse gives3, two π give4. Omitting the sign gives1. Negative valuations give4, changed uniformizer preserves2; 𝔽₂ and zero ring give1. | Two proved examples now test direction and sign. Generic signatures and all named boundary targets remain; no third example is added. |
| Maximal divisible subgroup (unchanged Lean companion) | Div(ℚ)=ℚ, Div(ℤ/6)=0, Div(ℤ)=0, Div(ℚ×ℤ/6)=ℚ×0. | Real-bodied supremum and its two proved examples retained. No ambient divisibility shortcut or chosen canonical complement introduced. |

## Sources read and limitations

Read the source passages behind the changed contracts; all repository prose is
in our own words. No passages from a source were copied into the repository.
The source locators already in the README are retained:

- K-book, author draft 29 August 2013, IV.5.5.1–5.6 printed p.314 and
  IV.5.7–5.9.2 pp.315–316: representation operations, Frobenius and perfect
  algebra p-divisibility. The explicit perfect-algebra generality is supported.
- DFM, 15-page author-uploaded manuscript, §2 pp.3–5, Propositions3.1–3.4/
  Theorem3.5 pp.5–9, Theorem4.1 and Propositions4.2–4.7 pp.10–12. Read its
  actual finite-stage lifting and transfer proof, including the exact
  representation-ring convention. Its finite-field completion theorem is not
  restricted to the semisimple modular-characteristic case.
- DM, 58-page author-uploaded text, §§4.4,4.7–4.18 pp.14–17,
  Theorem5.4/Propositions5.7–5.8 pp.19–20, §13 pp.55–56. Read the section,
  root-map cancellation, Iwasawa module and realization arguments; Theorem13.3
  is a conclusion of these, not an input. These passages were readable in the
  public author-uploaded full text even where direct PDF access declined.
- HM03, 22 January 2004 author version, Definition3.2.1,
  Proposition3.2.2/Addendum3.2.3/Lemma3.2.4 pp.47–49; HM04 pp.2,4–5,
  including absolute/relative distinction and Example1.2.5.
- Geisser–Levine, Theorem1.1 p.460, Theorem8.1 pp.489–490 and Theorem8.3
  p.491; Geisser–Hesselholt, Theorem3.1 and its finite-length approximation
  proof p.19. Retain the same-form-degree R−F map; do not propagate the
  printed intermediate degree mismatch.
- Baker §2 pp.3–4, Bousfield Theorems2.1/2.3 p.3, and Eilenberg–Moore
  Theorem12.1 p.220 and §16 pp.227–230 were checked for the retained
  completed-operation, zero-space and pullback contracts.

This does not reconstruct every proof behind the complete roadmap. The packet
was deliberately unchanged: it still records **39 source-proof gaps and 34
requests**. The repairs address missing prerequisite targets/ownership; they do
not certify packet closure or formalization. No restricted book was needed.
No suspicious instruction-bearing text was encountered. No subagents were used.

## Validation and delivered state

- `lean-check research/blueprint/packages/KTheoryFiniteLocalFields/Suggested.lean`:
  exit 0, **18 `sorry` warnings**, no other warnings/errors. The first draft of
  the new sign example needed a direct finite decision proof; the final proved
  example passes. Two real definitions, four proved examples, 206 lines.
- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json`:
  0 errors, 0 warnings, 280 nodes; recorded gaps/requests unchanged.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/KTheoryFiniteLocalFields/Suggested.lean`:
  exit 0.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  0 problems.
- `git diff --check`: exit 0.

Only the four authorized deliverables changed. `review.json` names this fix and
keeps `needs_changes` solely for the unresolved authorized supplier order. The
next worker should use the explicit current layer schedule above, not restart
from the obsolete M.7 references in the earlier handoff.

## Upstream notes

The field exact-representation-ring implementation is newer than the pins.
SchemeKTheoryOperations §6.3.4 should consume that current implementation for
fields when it is next synchronized; its general commutative-ring extension
remains a separate contract. No upstream roadmap or library file was edited.
