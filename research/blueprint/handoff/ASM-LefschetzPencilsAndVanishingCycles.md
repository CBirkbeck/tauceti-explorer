# Handoff: ASM-LefschetzPencilsAndVanishingCycles (issue #244)

This job assembles the roadmap *Lefschetz pencils, nearby cycles and vanishing cycles* from its two reviewed parts:

- the LPV.0 part (stages LPV.0–LPV.6, 89 nodes), written by BP-LefschetzPencilsAndVanishingCycles--LPV.0 and reviewed by REV-LefschetzPencilsAndVanishingCycles--LPV.0 on 6 October 2026: **needs changes**, all seven stages `partial`;
- the LPV.7 part (LPV.7 with LPV.7:semistable-curves and LPV.7:invariant-cycles, 36 nodes), written by BP-LefschetzPencilsAndVanishingCycles--LPV.7 and **accepted** by REV-LefschetzPencilsAndVanishingCycles--LPV.7 on 6 October 2026, all three stages `planned`.

Worker: Claude (Claude Code), session claude-ecxAZ4. I took no part in either part or in their reviews.

## Files

- `research/blueprint/readmes/LefschetzPencilsAndVanishingCycles.md`: the full roadmap document (about 70,000 words).
- `research/blueprint/suggested/LefschetzPencilsAndVanishingCycles.lean`: the two parts' suggested files, joined into one.
- `research/blueprint/handoff/ASM-LefschetzPencilsAndVanishingCycles.md`: this note.

The part packets are not deliverables of this job (the queue lists only the three files above), and they are unchanged. The fixes they need are listed below for a job that owns them, as ASM-HabiroRings did. No reviewed node's mathematics was changed, and no review verdict.

## What was done

### The roadmap document

- **Generated from the packets.** Every node section is generated from the two packets as their reviews left them, so the document agrees with them node for node. A scripted check finds every node id, API name, unit-test name, prerequisite, gap, request supplier, source issue and baseline declaration in the document, and all 195 source excerpts verbatim. None of the part documents' node text is reused: both reviews said their part documents lagged the corrected packets.
- **Per node.** Each section has:
  - the statement, hypotheses, proof or construction steps, API, unit tests, acceptance checks and uses;
  - the nodes of other roadmaps' packets that cite it;
  - the dependencies, grouped by owner;
  - the sources, the part's review verdict and note, and, for 24 nodes, an **Assembly note**.

  The header line of each node names its part and its Lean declaration, and marks the 75 nodes whose main declaration is an omitted signature in the joined Lean file.
- **Hand-written sections:**
  - purpose and scope with the headline theorems;
  - boundaries: suppliers, consumers, the RS-17 owner table and the LocalFieldsRamification overlap;
  - conventions;
  - a layer overview table and an overview of each of the ten layers;
  - Dependencies;
  - a table answering the sixteen requests other roadmaps file with this roadmap;
  - the closing list of what the blueprint does not claim.

  Generated closing sections give the 25 source issues, 18 gaps, 44 outgoing requests, 5 structural proposals, 8 upstream notes, the 47 baseline declarations, and the 17 sources with the versions read.
- **Notation.** Node prose uses:
  - ℚ_ℓ, ℤ_ℓ, ℚ̄_ℓ and t_ℓ, which the LPV.0 part also wrote Q_l, Z_l and t_l, and the LPV.7 part ℚℓ, ℤℓ;
  - ℤ/ℓ^n and 𝔽_q;
  - X_η, X_η̄, X_s and X_s̄, which the LPV.7 part wrote Xη, Xη̄, Xs and Xs̄;
  - a space between a word and a numbered reference ("Theorem 3.6.1"), which the LPV.7 part often dropped.

  Names, code spans, locators and excerpts are untouched. The Conventions section also gives a legend for the short labels (seq, nf, wb, …) by which the LPV.7 part's proofs refer to its own nodes.
- **The generator.** The node sections, tables and closing lists come from a script kept in scratch space, which this run deletes. Regenerating after a packet revision means reapplying the same rules: one section per node, in packet order within the layer order LPV.0, …, LPV.6, LPV.7, LPV.7:semistable-curves, LPV.7:invariant-cycles; the fields as listed above; and the notation pass on prose fields only.

### Cross-part prerequisites

- The LPV.0 part never refers to the LPV.7 part. The LPV.7 part cites six LPV.0-part nodes by id, ten times in all, and the stages LPV.0 (eight nodes), LPV.1 (seven), LPV.3 (three), LPV.4 (two) and LPV.5 (three), each with a request.
- The node graph of the two parts is acyclic, also through every packet on main (checked across all packets).
- There is one backward stage edge inside the roadmap, LPV.5 → LPV.4, with no node cycle. See fix 6 below.
- `python3 scripts/check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings on both part packets. `python3 research/blueprint/intake.py check-files` passes on the three deliverables.

### The Lean file

- **One file.** It has one standard note, one import block (the union of the two parts' Mathlib imports) and the packets' names unchanged:
  - the LPV.0 part's namespaces `TauCeti.AlgebraicGeometry.VanishingCycles`, `.Quadric` and `.LefschetzPencil`, in its order;
  - then the LPV.7 part's `TauCeti.LPV7`.

  The LPV.7 part's local `HasDerivedCategory.standard` attribute is dropped in favour of the LPV.0 part's global instances, which are the same construction.
- **Tau Ceti.** The LPV.0 part imported three Tau Ceti modules that have no compiled oleans in the shared build at the pins. Its review could not elaborate the file for that reason, and workers may not build Tau Ceti. The file therefore:
  - restates `TauCeti.genericFiber` and `TauCeti.specialFiber` verbatim from `TauCeti/AlgebraicGeometry/Fibers.lean` at f790474, as Over-pullbacks, in universe 0;
  - imports `Mathlib.RingTheory.Nilpotent.Exp` for `IsNilpotent.exp`;
  - uses no other Tau Ceti declaration in Lean.

  The note says that an implementation imports the Tau Ceti module instead.
- **One standard for both parts.** REV-…--LPV.0 found many suggested theorems false without their omitted hypotheses (an arbitrary representation is quasi-unipotent, any family of endomorphisms commutes, arbitrary maps are exact). The accepted LPV.7 file uses the same pattern for most of its geometric theorems, for example `localInvariantCycles` for an arbitrary representation and fixed-image map, `jacobianTateRealization : V ≃ₗ[F] T` for arbitrary V and T, and `curveJacobianPairing : uMinus = -uPlus` for arbitrary forms. The joined file applies the LPV.0 review's standard to both parts:
  - **Omitted signatures (98).** A declaration whose missing premise is a geometric object with no pinned form, and which is false for arbitrary arguments, is kept in a comment marked "Omitted signature". The comment gives its name, its node, the missing premises, a counterexample to the premise-free form, and that form verbatim. There are 68 in the LPV.0 part (64 declarations and 4 unit tests) and 30 in the LPV.7 part (27 declarations and 3 unit tests).
  - **Repaired (10).** Where the missing premise can be stated with Mathlib's vocabulary, it is stated:
    - a new `IsAdmissibleCoefficient S Λ` (Λ killed by an integer invertible on the trait, SGA 7 XIII 2.1.1), added to `RPhi_eq_zero_iff_locallyAcyclic` and to the tests `RPhi_smooth`, `RPsi_trait` (now about X = S) and `psiEta_smooth_constant` (now with actual constant sheaves);
    - `inertia_eq_top_of_strictlyHenselian` now assumes the residue field of R separably closed (it assumed the residue field of the valuation ring of K̄, which is always algebraically closed, so it claimed I = D for every trait);
    - `twistedMonodromyEquivariance` is now the true linear core: F T = exp(q⁻¹ log T) F implies N F = q F N;
    - `finiteFieldPencilDescent` assumes the axis scheme of finite type over the finite field;
    - `absoluteIrreducibilityOfTheVanishingQuotient` assumes the hypotheses of Weil I 5.5: a nondegenerate form, vanishing cycles spanning V, conjugate up to sign, each the axis of a transvection in the image;
    - `localGlobalFixedComparison` assumes generation by the local transvections, with B reflexive and preserved;
    - `fixedSpaceOfTheLocalTransvections` is now proved from the LPV.0 part's own `forall_transvection_apply_eq_self_iff`.
  - **Kept.** Data-valued `sorry` (functors, objects, maps that exist) and every statement that is true as written, for example the finite logarithm, the monodromy filtration, maximal unipotence, the quadratic-form definitions and tests, Weil I 5.11, the curve monodromy factorization and invariants, and `generalPencilMonodromy`.
- **Packet agreement.** A scripted check finds every node name, API name and unit-test name of both packets in the file, as a declaration, in an omitted signature, or as a test docstring.
- **lean-check** at the pinned Mathlib 082e2d3 exits 0. Its only warnings are 198 `declaration uses 'sorry'`; the file has 174 declarations and 93 examples.

## Fixes the part packets need (not deliverables here)

None changes a statement. They are for the LPV.0 revision round and for a job that owns the LPV.7 packet.

1. **Source-issue id collision.** Both packets use `LefschetzPencilsAndVanishingCycles/E13` and `/E14`.
   - The LPV.0 part's are Illusie 1994 errata.
   - The LPV.7 part's are Saito 2003 cross-reference misprints, added when its review believed the LPV.0 part stopped at E12.
   - `data/source-issues.json` already lists both pairs under the same ids. Renumber the LPV.7 part's as E24 and E25.
2. **The LPV.7 part's eight citations of the stage `LPV.0`** stand for the rational realization. They can cite `LPV.0/adic-nearby-cycle-realization`, with `LPV.0/coefficient-and-trait-change`. The request to LPV.0 then narrows to what that node does not state: compatibility of the rational triangle with proper base change, stalk calculations and support localization.
3. **The LPV.7 part's seven citations of the stage `LPV.1`.**
   - `node-residue-variation-sign` → `LPV.1/finite-monodromy-logarithm`, `LPV.1/normalized-can-var`.
   - `curve-monodromy-factorization` → `LPV.1/finite-monodromy-logarithm`.
   - `curve-inertia-invariants` → `LPV.1/finite-monodromy-logarithm`, `LPV.1/twisted-monodromy-equivariance`.
   - `curve-monodromy-filtration` → `LPV.1/monodromy-filtration`.
   - `curve-choice-basechange-compatibility` → `LPV.1/finite-extension-and-logarithm-rescaling`, `LPV.1/twisted-monodromy-equivariance`.
   - `snc-nearby-cycle-description` and `snc-graded-nearby-complex` need more than LPV.1 plans: tame inertia on strictly semistable charts, and the monodromy filtration of a nilpotent endomorphism of an object of an abelian category (Saito 2003 §2.1). LPV.1 plans the filtration only on finite-dimensional vector spaces. Either the LPV.0 revision adds that node to LPV.1, or the LPV.7 part records it as a gap; today only the request says so.
4. **`node-residue-variation-sign`** handles nodes of any thickness n_e = v(a_e), but cites `LPV.2/local-picard-lefschetz-formula`, which assumes a regular total space (thickness one). Add `LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, whose Kummer character of b is v(b)·t_ℓ.
5. **`snc-graded-nearby-complex`** recovers in its two-component acceptance case the three grades of `LPV.1/two-component-semistable-nearby-complex`. Cite it as the special case it must agree with; this is acyclic.
6. **The stage edge LPV.5 → LPV.4.**
   - `LPV.4/cohomology-sheaves-of-a-lefschetz-pencil` uses `LPV.5/vanishing-cycles-are-conjugate` for "one vanishing cycle is zero only if all are".
   - `LPV.4/global-fixed-and-local-fixed-interface` uses `LPV.5/monodromy-generated-by-local-transvections`, which realises LPV.4 too.

   Stating LPV.4's two cases ("all nonzero", "all zero") with the dichotomy as an LPV.5 corollary, and placing the global-invariant comparison in LPV.5, removes the backward edge. It may matter when the packet is promoted, since stage links are derived from prerequisites.
7. **Stage cycles with DWP.4 and IG.4.** These are already gap G-review-supplier-order:
   - `LPV.5/finite-orthogonal-ade` and `LPV.5/integral-failure-and-arithmetic-routing` cite the stage DWP.4, which consumes LPV.0–LPV.5;
   - `LPV.6/igusa-semiperversity-interface` cites the stage IG.4, which consumes LPV.6.

   Cite the specific earlier outputs, or the promotion will install whole-stage cycles.
8. **Constant coefficients versus arbitrary K.** The LPV.7 part's requests to LPV.3, LPV.4 and LPV.5 (gap G-complex-pencil) ask for the incidence, pencil and monodromy statements of Weil II 6.2.10–12 and 4.3.6–8 for an arbitrary constructible complex K. No LPV.0-part node states them, and the LPV.0 part's coverage of LPV.3–LPV.5 does not list them as remaining. The LPV.0 revision should add them to those coverage records, or plan them.
9. **Format.**
   - The LPV.0 part's `restructure` entries use `title`/`reason`/`proposal` rather than the protocol's `action`/`roadmaps`/`detail`/`proposal`.
   - The LPV.7 part's uses `extends`/`scope`/`neededBy`.
   - The working namespace `TauCeti.LPV7` should become a permanent one; the library modules it records are `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable` and `…/InvariantCycles`. Change it in the packet and the Lean file together.
10. **The superseded part documents and Lean files.** `readmes/…--LPV.0.md` and `…--LPV.7.md` are superseded by the assembled document, and the two part Lean files by the joined file. They are not this job's files and were not edited.

## Structural proposals of the parts

All five are given in the document's "Structural proposals" section. Each is a Part II of an existing roadmap, and none changes this roadmap's layers.

| Proposal | Part | Needed by |
|---|---|---|
| EtaleDualityAndPerverseSheaves, Part II: absolute purity and Gysin diagrams for regular pairs over an excellent henselian trait | LPV.0 (also requested from EDC.3; the LPV.7 part's G-trait-purity needs the same) | LPV.1 two-component complex, LPV.2 odd Picard–Lefschetz, LPV.7 strict semistable nodes |
| SchemeAndStackFoundations, Part II: general Artin approximation and Elkik versality | LPV.0 | LPV.2 approximation and versal-deformation nodes (G-approximation) |
| LieGroups, Part II: p-adic exp/log charts, closed subgroups, openness from the full Lie algebra | LPV.0 | LPV.5 compact-subgroup lemma and Kazhdan–Margulis (G-padic-Lie) |
| LieHighestWeight, Part II: the SL₂ realization of a nilpotent Jordan block | LPV.0 | LPV.1 primitive decomposition and tensor rules |
| HodgeStructures, Part II: geometric degeneration mixed Hodge structures | LPV.7 | LPV.7 complex invariant cycles (G-complex-mhs) |

The parts also request two further Part II extensions without a `restructure` entry:

- EtaleDualityAndPerverseSheaves, Part II for EDC.5: rectified trait perversity, integral p/p+ conventions and the enlarged category;
- ClassicalGroups, Part II: ℚ_ℓ form-preserving groups.

In addition, DeligneWeightsAndPurity's DWP.0 packet asks this roadmap for an "LPV, Part II": curve reduction of a normal finite-type scheme with the same monodromy image (Weil II 1.3.1, 1.3.4 and 1.11.4). Nothing plans it; the maintainer decides.

## Requests

- **Outgoing.** 44 requests: 21 from the LPV.0 part, 23 from the LPV.7 part. They are tabulated in the document.

  | Supplier | Requests |
  |---|---|
  | EtaleDualityAndPerverseSheaves (EDC.0, .1, .1:biduality, .2:pairings, .2:trace-purity, .3, .4, .5, .6) | 13 |
  | SchemeAndStackFoundations (SF.0, SF.2, SF.4, key/excellent-schemes) | 4 |
  | EnhancedDerivedSheaves E0, E1, E4 | 3 |
  | ArithmeticGaloisRepresentations R01.2; ArithmeticGaloisDuality R02.1, R02.2 | 3 |
  | DeligneWeightsAndPurity DWP.4, DWP.5 | 2 |
  | Tau Ceti CharacterTheory, ClassicalGroups, LieHighestWeight, RootSystems, StableReduction (layers 1, 4, 5), EllipticCurves, HodgeStructures | 9 |
  | FF.0, IG.1, IG.4, A3, ComplexComparisonPartII C5 | 5 |
  | this roadmap's LPV.0, LPV.1, LPV.3, LPV.4, LPV.5 (from the LPV.7 part) | 5 |

- **Incoming.** Sixteen requests from other roadmaps' packets, from AutomorphicGaloisRepresentations, ClassicalAdicEtaleCohomology, CrystallineCohomology, DeligneWeightsAndPurity, MordellLawrenceVenkatesh and WeightsInEtaleCohomology. The document's "Requests from other roadmaps" table answers each with node ids. Five are not, or only partly, planned:
  - ClassicalAdicEtaleCohomology asks for the nearby-cycle construction with an arbitrary torsion coefficient ring.
  - ClassicalAdicEtaleCohomology asks for N at finite level ℤ/ℓ^n, which exists only when the nilpotence order is at most ℓ.
  - CrystallineCohomology CR.5 asks for Abhyankar's lemma, which IG.1 owns.
  - DeligneWeightsAndPurity's DWP.0 packet asks for the Weil II §3.1 surface pencils, geometric constancy of R^n/ℰ and ℰ ∩ ℰ^⊥, and the "LPV, Part II".
  - DeligneWeightsAndPurity's DWP.7 packet asks for the 4.3.2–4.3.8 fixed-part theorem for every Lefschetz pencil, not only a general one.

## For the maintainer and the reviewers

- **The LPV.0 part still needs its revision round.** The queue has no BP-…--LPV.0~2 job yet. When that revision lands, the document's LPV.0–LPV.6 sections and the joined Lean file must be regenerated from the revised packet, by the method above. The omitted signatures already state the hypotheses a revision should restore, so the revision can start from the joined file.
- **The LPV.7 Lean forms.** The joined file demotes 27 declarations and 3 tests of the accepted LPV.7 file, which its review accepted as "signature shadows". The mathematics in the packet is unchanged, and so is the part's verdict. Whether the atlas wants the LPV.0 review's stricter standard applied to accepted files is a question for the maintainer; the joined file applies it to both parts so that it is consistent.
- **LocalFieldsRamification overlap.** The Tau Ceti LocalFieldsRamification link map proposes that LPV.1 compare its trait inertia and t_ℓ with layer 4's I_K, P_K and Ẑ^(p′)(1). RS-17, which is later, makes ArithmeticGaloisRepresentations R01.2 the owner of the tame character LPV.1 imports. No node plans the comparison; it sits most naturally with R01.2.
- **Compilation.** The file was compiled with `lean-check` in the shared build. Its Mathlib is at the pin. Its Tau Ceti checkout is at a different commit and has no compiled oleans for the modules the parts imported, which is why the file restates the two fibre constructions instead of importing them.
