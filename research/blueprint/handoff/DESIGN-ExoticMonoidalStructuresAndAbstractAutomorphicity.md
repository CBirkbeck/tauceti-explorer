# Handoff — DESIGN-ExoticMonoidalStructuresAndAbstractAutomorphicity

Completed target-level planning pass, 19 October 2026. Issue #3456;
agent Codex, session `codex-zDZPuM`, branch
`codex-zDZPuM-exotic-monoidal`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/3456#issuecomment-6258508545)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/3456#issuecomment-6258510147)
by the bot. This is a complete design submission for independent review.
Implementation remains unchecked throughout.

## Deliverables and coverage

- [Roadmap definition](../roadmaps/ExoticMonoidalStructuresAndAbstractAutomorphicity.json):
  twelve layers and their target statements, dependencies and sources.
- [Packet](../packets/ExoticMonoidalStructuresAndAbstractAutomorphicity.json):
  complete planning pass, exact supplier dependencies and explicit proof debts.
- [Reader](../readmes/ExoticMonoidalStructuresAndAbstractAutomorphicity.md):
  conventions, all targets, proof routes, APIs, tests, Checks, source corrections
  and the 47-item routing map.
- [Suggested Lean](../suggested/ExoticMonoidalStructuresAndAbstractAutomorphicity.lean):
  89 lines over existing carriers, following the current WORKERS shape.

There are **57 nodes: 13 definitions, 21 constructions, 20 theorems,
2 comparisons and 1 application**. They carry **142 API items, 103 unit tests,
53 planets and 6 baseline declarations**. Each definition/construction has at
least three API items and three discriminating tests, with concrete consumers.
The prerequisite inventory includes 49 exact supplier-node references and
17 residual stage requests. The packet records four gaps and twelve source
issues. All 47 items routed here by PAPER-DOR-23 are mapped to targets.

| Stage | Status | Principal remaining work |
| --- | --- | --- |
| EX.0 | planned | Obtain the smooth, Fourier and scalar-Weil contracts, including odd equal characteristic; implement the triality action and lift. |
| EX.1 | planned | Receive Kirillov/zeta interfaces and resolve the singular-stratum calculation G1. |
| EX.2 | planned | Implement balanced smooth products, unit and trace after the exact Whittaker supplier contracts. |
| EX.3 | planned | Implement firm Bernstein enrichment and the degeneracy-free equivalence. |
| EX.4 | planned | Receive the twisted spherical-centre comparison and prove both local counit equations. |
| EX.5 | planned | Check mixed-map naturality and coherence; assign and resolve categorical infrastructure G2. |
| EX.6 | planned | Receive function-field restricted tensor, theta and noncuspidal zeta contracts. |
| EX.7 | planned | Prove compactness, the determinant-kernel image theorem and all algebra/module laws. |
| EX.8 | planned | Implement the actual module-object category and full-faithfulness/closure statements. |
| EX.9 | planned | Resolve adelic normalization G3 and spin transport/involution G4. |
| EX.10 | planned | Receive the normalization-module freeness contract and prove induction/intertwiner comparisons. |
| EX.11 | planned | Receive all-constituent Eisenstein and multiplicity-one contracts; prove Weyl lifting, decomposition and irreducible comparison. |

No stage is closed. The packet's coverage records include transitive proof
debts and supplier requests. Every target is planned; no part of this pass
needs to be resumed as an unread layer.

## Mathematical boundaries to retain in review

The local hypothesis is char F ≠ 2, permitting odd equal characteristic and
also residue characteristic two in characteristic zero. The metaplectic
requests distinguish the scalar extension from its double-cover variants.
The open kernel is stable under the middle mirabolic, and generates the full
kernel; it is not itself a middle-G submodule. Both Mellin comparisons preserve
the s+1/2 and s−1/2 powers and place the Mellin factor on the Godement–Jacquet
side of the equality for the resulting Whittaker integral.

The smooth right-module conversion uses transpose. Ordinary contragredients
in the local spectral calculation are distinguished from the transpose dual
Dτ used by the global function model and Petersson pairing. The latter is
integrated over the rational quotient. The initial theta multiplication has
unrestricted-support output; its compact restriction is proved for I.

Finite-support Hom is distinguished from full Hom and roughening. In
particular full End of the Whittaker generator is a product of block centres,
while its enriched endomorphisms form their direct sum. The spherical generator
is induced from SL₂(O), allowing ramified determinant characters. The explicit
adelic spherical carrier is I^SL₂(O_A) ≅ I_SL₂(O_A), identified with the smooth
averaging-idempotent part of Hom from EA. Its scalar centre is
End(IdMod(G)); no unconstructed spectral function model is assumed.

Generic irreducibility does not imply degeneracy-freeness: Steinberg and the
two extension orientations are tests. The pair functor used for associativity
is faithful, with mixed-map naturality still required. The idempotent theorem
retains both intertwining hypotheses. The higher-categorical trace has its
own infrastructure gap rather than an assumed carrier.

The automorphic category includes noncuspidal objects. Full faithfulness and
subquotient closure do not imply extension closure. Dor normalized induction
uses S(F × F×), including additive zero, and the specified injection η;
restriction is its left adjoint. A global η is not postulated from local maps
that fail almost-everywhere reference compatibility. EX.11 proves Weyl lifting
before using it for component algebras. The norm-image generator is an idele,
without an assumption that the curve has a degree-one place.

## Four exact gaps

1. **G1 — smooth Tor in the singular-stratum comparison.** Dor23 Lemma 2.20,
   pp. 16–17, needs an identified degree-one edge term or connecting map and
   its vanishing under the no-SL₂-invariant-functional hypotheses. Vanishing
   of zeroth balanced tensors does not establish that statement. SR.0 supplies
   the machinery; EX.1 owns the particular calculation.
2. **G2 — presentable linear category self-duality.** Dor23 Remark 3.54,
   p. 35, uses presentable complex-linear categories, their tensor universal
   property and smooth Eilenberg–Watts coevaluation. No supplier for this
   generic infrastructure was found. Assign it once to a category-theory owner
   and prove the triangle identities. EX.2's ordinary trace identity remains
   separate from this assertion.
3. **G3 — adelic spherical counit normalization.** Dor23 Appendix A,
   Constructions A.5 and Claim A.6, p. 51, does not specify the counit or all
   local transports. Compute lattice-adapted h_v and modulus factors, check
   almost-everywhere reference compatibility, both counit equations and
   invertibility of comultiplication.
4. **G4 — spin transport and weighted involution.** Dor23 Construction A.7
   and Remark A.8, p. 51, assert the invariances without the calculations.
   Compare products after ω changes to a²ω and Λ to a⁻¹Λ, then verify the
   determinant-weighted inverse-transpose identity on the same carrier.

## Supplier routing and current-main audit

Seventeen requests are recorded in the packet; none was sent to another
worker or turned into an additional claimed job:

- **SmoothRepresentationsOfLocalGroups:** SR.0 derived extension for smooth
  Tor; SR.1 for firm tensor/internal Hom, roughening and averaging; SR.2 for
  residual balanced actions, Whittaker exactness and compact block generators;
  SR.3–SR.4 for transpose-invariant central distributions and twisted spherical
  endomorphism centres. The latter keeps the already routed
  SmoothRepresentationsPartIIParahoricCenters ownership.
- **AutomorphicLFunctionsAndLocalFactors:** AL.0 for the full equal-characteristic
  Fourier scope; AL.1 for algebraic normalization-module freeness; AL.3 for
  local Whittaker zeta and global compact-function convergence. The packet
  proposes Part II for the Fourier scope and zeta-integral-module extension.
  Dor20Z Claim A.3, p. 26, supplies the local freeness result; the requested
  torus coordinate change and character twist are explicit.
- **GL2AutomorphicRepresentationsAndTransfer:** R16.2 for all-field generic
  classification, Kirillov boundaries and extension orientations; R16.4 for
  function-field cuspidal multiplicity one and factorization.
- **MetaplecticAutomorphicForms:** MP.1, MP.2, MP.4 and MP.5 for the local
  odd-characteristic and global function-field extensions already routed to
  MetaplecticAutomorphicFormsPartIIFunctionFields. Replace these temporary
  base-stage receipts when that Part II has assigned stage ids.
- **FunctionFieldArithmetic:** FA.1 for spin input through actual line bundles;
  FA.2 for arithmetic restricted tensor and measure interfaces; FA.6 for the
  compact-function spectral and all-Eisenstein-constituent inputs. The exact
  degree-sensitive Chebotarev receipt is an existing FA.5 node and preserves
  its DWP.3 owner.

Current TauCetiRoadmap main was checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`. SemisimpleAlgebras and completed
RestrictedProducts supplied full neighboring roadmap examples. Current
AlgebraicVectorBundles owns line bundles and tensor products; completed
RestrictedProducts owns topological coordinate and reference-change APIs.
Their suggested carriers and the current Tau Ceti library were checked for
overlap, and this submission imports their work. No higher-tier notion was
moved. The baseline remains Mathlib `082e2d3` and Tau Ceti `f790474`.

## Sources and source findings

Four public versions were read on 19 October 2026. Their URLs, editions,
read locations and PDF SHA-256 values are in both JSON source lists. No
private reference was needed and no source required for this planning pass
remains inaccessible.

- **Dor23**, Forum of Mathematics, Pi 11 (2023), e20, version of record:
  §§2.1–2.3, pp. 7–17; §§3.1–3.6, pp. 18–38; §§4.1–4.6,
  pp. 38–49; Appendix A, pp. 50–51.
- **Dor21**, arXiv:2102.11820v1: §A.1, pp. 4–10;
  §§B.2–B.6, pp. 15–33; the B.7 constructions/proofs used for the
  intertwiner, pp. 33–40; §§C.2–C.5, pp. 42–55.
- **GH11**, arXiv:1108.0351v1: Theorem 3.1.2 and its hypotheses,
  pp. 10–11, and Appendix A proof, p. 15.
- **Dor20Z**, arXiv:2012.03068v1: Appendix A statements and local
  reduction, p. 25; Claim A.3 and proof, p. 26. The archimedean
  assertions are not inputs here.

The twelve source findings are recorded individually, in new words, with
locators and correction searches. They include the torus-letter misprint,
adelic Fourier domain, Petersson quotient, unramified reference vector,
Steinberg naming, repeated heading, omitted global counit, conductor lattice,
sequel induction direction, unwarranted degree-one-place assumption, the Tor
proof step and the omitted spin computations. Nodes state the corrected or
qualified targets. No source passage or section-by-section source summary is
submitted.

## Validation and next action

- `python3 scripts/check_blueprint.py research/blueprint/packets/ExoticMonoidalStructuresAndAbstractAutomorphicity.json`:
  **0 errors, 0 warnings**, twelve planned stages, zero closed stages.
- `lean-check research/blueprint/suggested/ExoticMonoidalStructuresAndAbstractAutomorphicity.lean`:
  **exit 0**, only nine declaration-uses-sorry warnings, at pinned Mathlib.
  Memory exceeded 20 GB before the check. No background Lean process remains.
- The Lean file has one real-bodied native matrix definition, four pairing
  lemmas, four examples and the general categorical idempotent theorem. The
  reader specifies every omitted heavy carrier and target. This follows the
  current WORKERS shape in place of the older issue's exhaustive-file wording.
- `intake.py check-files`: **5 files, 0 problems**; `check_sorry_data.py`:
  **exit 0**. The reader/packet/roadmap inventory check verifies every target,
  API name and test name, all 47 routed items and the layer planet limits.

Independent review should first check the four gaps, both Hom/smooth-part
distinctions, the supplier scope extensions and the normalized induction
formulas. Supplier integration and the stated calculations are the remaining
mathematical work. This handoff is durable; the job scratch directory is
removed after the pull request opens.
