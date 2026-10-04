# Handoff — BP-FiniteFieldsAndCharacterSums

Current pass: **Codex — codex-5ebb6f**, 4 October 2026, issue #1029. Accepted RS-03 remains binding.

This is a **complete planning pass under current PROTOCOL section 0**, not mathematical closure or an independent
review of the predecessor. The incoming packet already has 354 nodes, beyond the 300-node budget. This pass adds
no nodes. All 354 whole node objects, 457 baseline records, 32 sources, 34 source issues, six gaps, 31 requests and
five structural proposals are retained unchanged. Packet status routes the work to independent review; coverage
lists the exact unfinished targets and proof inputs for stage follow-ups and assembly.

| Layer | Coverage | Nodes | Remaining items |
|---|---|---|---|
| FF.0 | source decomposed | 11 | 0 |
| FF.1 | partial | 42 | 3 |
| FF.2 | partial | 89 | 11 |
| FF.3 | partial | 104 | 4 |
| FF.4 | partial | 91 | 7 |
| FF.5 | planned | 17 | 1 |

The reader's introduction and layer table agree with this coverage. FF.3 is now partial because the routed
Bergstrom–Faber–Payne square-free counting target is absent; a square-free decomposition algorithm does not state
the enumeration theorem. FF.1 also lacks the routed two-point interpolation sum. Weil II 3.7.2–3.7.3 and the
Weil I compactification/lissity proof frontier are explicit rather than treated as closed by target-name matches.
FF.0's target coverage remains source decomposed. FF.5 retains its specialized application targets under accepted
RS-03, despite the older audit's process-layer classification; its imported inputs and raw stage-edge correction
are not closed.

## Reading and ownership evidence

This pass reads the issue and comments, the reviewed six-stage library audit, the accepted RS-03 finite-field
scope and touching links, the current atlas stage edges, all seventeen issue-listed confirmed red-team findings,
selected exact target/prerequisite statements, and the two routed Bergstrom–Faber–Payne extraction items. Existing
same-worker readings of the nearby AlgebraicCurves and JacobianChallenge upstream documents remain applicable.
This is not a fresh line-by-line reading of the 354-node packet, its full reader, all 32 source PDFs, or all 457
pinned declarations. The mathematical objects are preserved for independent review rather than re-certified here.

The AdditiveCombinatorics packet already supplies `AC.0/fourier-transform` and `AC.0/fourier-parseval`. Their exact
statements were read: the transform is dual-indexed, normalized by 1/|G|, and compared with `ZMod.dft`; the Parseval
conventions distinguish the measures on the group and its dual. The inherited AC.0 request remains until the
finite-field carrier and character-dual transport are verified against FF.1's consumer. No new Fourier carrier is
planned. Coding and curve link evidence preserves their built carriers and requests. Foreign packet edits and
live stage-edge changes are outside this issue's deliverables.

Sixteen `sourceVersions` receipts identify the thirteen sources named by inherited source issues, with separate
Sutherland lecture-file hashes. All dates and hashes come from the predecessor's explicit records and are
attributed to Claude Code — cc-2aeb03 (25 September 2026). They are not fresh source-file receipts. Findings against
BKK, Browning–Sawin, FKMS, Shallue and other preprints, and the Goresky–Klapper 2009 author draft, apply to those
texts; their version-of-record collation remains open. The Deligne SGA 4½ receipt is a published scan. Existing
sourceIssues and their correction-search claims are preserved, not independently confirmed or declared newly found.

## Confirmed red-team finding dispositions

These are continuation observations and recorded open work, not independent review verdicts.

| Finding | Current disposition and remaining check |
|---|---|
| RT-AREA-finitefields/1 | Declaration prerequisites are retained; the raw FF.2→FF.3→FF.4→FF.5 stage chain still requires evidence-backed restructuring. Factorization should import FF.0/CA.3 directly, with FF.2 estimates only for their actual consumers. |
| /2 | The current elliptic Hasse contract is imported from Tau Ceti; the hyperelliptic affine count uses FF.2's multiplicative Weil bound. A general-curve bound would need the exact WC.5 input and is not supplied by relabeling either node. |
| /3 | GOS remains a recorded gap, EDC.2 request and owner proposal. The Artin–Schreier Swan computation remains FF.2's local input. |
| /4 | Weil I 8.4 duality and 8.5 concentration have explicit target nodes; 8.6–8.10 compactification and local constancy remain unresolved prerequisite leaves. |
| /5 | Existing additive Artin–Schreier degeneracies and multiplicative c·h^ord(χ) degeneracies retain exact-value statements and controls, including a square with a cubic character. No new cancellation claim is made. |
| /6 | Built finite-field theory remains among the inherited pinned baseline citations; the eleven FF.0 nodes retain only the certified presentation/Rabin/tensor/normal-basis refinements. Their whole objects are unchanged. |
| /7 | Built Gauss/Jacobi identities and the new convention/transport interfaces are distinguished in the inherited packet; this pass does not plan another Gauss-sum carrier. |
| /8 | Hasse–Davenport lifting has explicit inherited nodes; the product formula's factorial/root-of-unity identification remains a gap. |
| /9 | FF.2's ℓ-adic targets remain behind explicit supplier requests. GOS ownership and actual cohomological Lean signatures remain open. |
| /10 | The current extract has no integrated decomposition; existing EXT-08/source provenance is retained. This worker does not promote data or claim an integrated blueprint exists. |
| /11 | FF.3's factorization certificates import FF.0 Rabin witnesses and remain the service for CN.1. Resolving any surviving foreign duplication requires its owner job. |
| /12 | FF.3 remains the finite-field factorization/point-count service for FA.7; no duplicate function-field algorithms or foreign edits are introduced. |
| /13 | FF.4 retains finite-field linearized-polynomial theory and the proposal for comparison with DM.0's Ore carrier. Wu–Liu composition/trace/subalgebra proof nodes remain open. |
| /14 | FF.4 retains explicit evaluation, RS/BCH and AG-code targets and their built coding/curve inputs. The Hermitian example and supplier comparison remain open. |
| /17 | Thirty-two inherited public source records are preserved. This pass adds version provenance, not a claim to have re-read every finite-ring, permutation, sequence, coding or graph proof; the two FF.4 source-proof gaps remain. |
| RT-AREA-etale/7 | Uniform Lang–Weil and geometric Chebotarev targets exist, but the uniform Betti bound and constant-field Frobenius-coset variant remain explicit gaps/frontier items. |
| RT-AREA-etale/14 | The Artin–Schreier and global Fourier–Deligne targets exist. Compare canonical sheaf/global-transform ownership and the distinct local Fourier service before closing the Kloosterman dependency route. |

## Lean and validation receipt

The **entire suggested file** was freshly elaborated, using an existing Mathlib build at the exact pinned commit
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Lean `v4.34.0-rc2`. Its 78 imports are Mathlib modules;
there are no Tau Ceti imports, so a differently pinned root Tau Ceti checkout does not supply this file's objects.
The invocation used one thread, an 8,192 MiB limit and a 1,200-second timeout after checking 38 GiB available.
It exited 0 after 16.51 seconds: **0 errors, 1,025 warnings, all admission warnings, 0 other warnings**.
Signature elaboration does not prove the planned mathematics. Existing ℓ-adic cohomological signatures omitted
by the predecessor remain omitted; their absence is explicitly in FF.2's remaining work.

- Suggested file: 6,563 lines; SHA-256 `e2dab9fdf7a24789c59b8dab49b4f2b9eb02e1e5b70f190d639ce1b28241cf67`.
- Compile log: SHA-256 `a5381370595cd6c2f3859d926473f12a5171f9b78f21cec1c1f7ff61f9eddb80`; started 2026-10-04T20:05:26.228320+00:00.
- Replay: use the existing pinned Mathlib build and elaborate the issue's suggested file with `lake env lean`,
  one thread and an 8,192 MiB memory limit. No library build or cache fetch is required.
- The only Lean changes are four planning-boundary comment lines; all imported modules and declaration bodies
  are preserved. All implementation statuses remain unchecked.

Validation passed: the indexed blueprint checker reports 0 errors and 0 warnings; the source-issue and
source-version validators report 0 errors; actual submission file checks report 4 files and 0 problems;
automatic intake rules report no refusals; the whitespace check passes. Whole-object preservation checks
confirm every inherited node and all baseline/source/request/gap/structural records are unchanged. No new
atlas-wide graph assembly is claimed for this metadata-only pass. The private compile log is deleted after
the pull request opens; this handoff contains the result and hashes, with no dependency on private scratch paths.

## Where to resume

Independent review should check the inherited mathematics and the fidelity of this frontier. Stage follow-ups
must start with the missing routed target in FF.1 or FF.3, or a precise FF.2/FF.4 gap, and compare supplier nodes
before adding definitions. Read the exact public source passage before creating any new node. Preserve all
34 version-scoped source findings until their independent checking and publication collation are complete.
The predecessor handoff below is historical: its partial packet status, FF.3 source-decomposition claim and
absence-of-AC.0 statement are superseded by the current pass above and the packet's coverage records.

## Predecessor handoff (Claude Code — cc-2aeb03, 25 September 2026)

# Handoff — BP-FiniteFieldsAndCharacterSums

Job `BP-FiniteFieldsAndCharacterSums`, issue #1029. Agent: Claude Code, session `cc-2aeb03`, 25 September 2026.

- **First pass.** No packet or reviewed decomposition existed.
- **Binding restructuring:** RS-03 (accepted), followed as written:
  - FF.0, FF.1, FF.3 and FF.5 are narrowed to their `keeps`, and FF.2 and FF.4 are kept.
  - FF.1 is the single owner of the character and Gauss–Jacobi normalisations.
  - FF.2 is the single owner of the Weil–Deligne estimate handoff.

## Deliverables

- **Packet:** `research/blueprint/packets/FiniteFieldsAndCharacterSums.json`.
  - 354 nodes: 179 theorems, 71 lemmas, 59 definitions, 42 constructions, 2 comparisons and 1 application.
  - 562 API items, 374 unit tests and 32 planets (at most six per layer).
  - 457 pinned baseline declarations and 32 sources.
  - 34 source issues, 6 gaps, 31 requests and 5 structural proposals.
  - `python3 scripts/check_blueprint.py … --index <pinned index>` reports 0 errors and 0 warnings.
- **Roadmap document:** `research/blueprint/readmes/FiniteFieldsAndCharacterSums.md`, one section per layer, which agrees
  with the packet.
- **Suggested Lean file:** `research/blueprint/suggested/FiniteFieldsAndCharacterSums.lean`, 6,560 lines in namespace
  `TauCeti.FiniteFieldSums`.
  - It **compiles**: `lake env lean` at Mathlib `082e2d3` gives only `declaration uses 'sorry'` warnings.
  - Every API item and unit test occurs under its packet name.
  - FF.3's factorisation certificates use FF.0's `RabinCertificate f` directly, not a local copy.
  - The ℓ-adic objects of FF.2 on open subsets of the line are stated through their Galois characters. The cohomological
    statements are listed in the file, not declared with placeholders.

## What is closed and what remains

| Layer | Status | Nodes | What remains |
|---|---|---|---|
| FF.0 | source decomposed | 11 | nothing |
| FF.1 | partial | 42 | the proof of the Hasse–Davenport product relation (no public proof read; gap); the AC.0 request for the general finite-abelian Fourier transform |
| FF.2 | partial | 89 | the Grothendieck–Ogg–Shafarevich formula (no owner; gap and structural proposal); Weil I Lemma 8.5's compactification and local constancy (gap); the uniform Lang–Weil constant (Katz's Betti bound; gap); Ekedahl's geometric Chebotarev variant; *Sommes trig.* §§4–7 (hyper-Kloosterman sums); FKMS §5 quasi-orthogonality |
| FF.3 | source decomposed | 104 | nothing; the cost model is requested from ComputationalNumberTheory CN.0 |
| FF.4 | partial | 91 | units of GR(2^n, r) for r ≥ 2 (gap); Katz's Soto-Andrade estimate for the Terras graphs (gap); Wu–Liu §§3, 5–6; Goresky–Klapper §§13.3–13.4 and 14.1–14.7; the Hermitian-curve code as an example |
| FF.5 | source decomposed | 17 | nothing |

**Acceptance conditions:**

- **FF.0.** Field isomorphisms come with their inverses, and the Frobenius exponents and trace targets are explicit.
- **FF.1.** The trivial-character cases are separate nodes, with Mathlib's zero convention compared with the classical one.
- **FF.2.** Artin–Schreier-trivial phases and multiplicative perfect powers are degenerate cases with their exact values,
  not given a false square-root bound.
- **FF.3.** Factorisations carry checked certificates (the product identity plus a Rabin certificate per factor). Point
  counts use the trace convention a_q = q + 1 − #E(F_q), with the Hasse bound imported from Tau Ceti EllipticCurves layer 3.
- **FF.4.** Reed–Solomon and BCH codes carry their field-size and length restrictions (n ≤ q), with encoding maps,
  dimension and distance.
- **FF.5.** Consumers instantiate exact constants, and no node infers computational hardness from correctness.

**Requests answered:**

- **ClassicalArithmeticCompletion CA.1** requested the character conventions. They are `FF.1/trivial-character-conventions`,
  `FF.1/gauss-sum-transport` (with the shift identity) and `FF.1/canonical-additive-character`.
- **Stickelberger.** FF.1 also plans `FF.1/stickelberger-congruence` and `FF.1/stickelberger-relation`. The
  ClassicalArithmeticCompletion packet records "Stickelberger's theorem … has no owner" as a gap for CA.1's Eisenstein
  reciprocity. That gap can now point to these nodes. This session wrote that packet, and a follow-up there should re-point
  it.

**Sources beyond the roadmap document.** The accepted source routes of two paper extractions name these layers. Their
items are covered:

- **Bary-Soroker–Koukoulopoulos–Kozma** (Invent. Math. 2023), route 3: FF.1 (the Fourier analysis on 𝔽_p((1/T)), planned
  once), and FF.3 (the counts of irreducible polynomials);
- **Browning–Sawin** (Ann. of Math. 2020), route 2: FF.2 (the Artin–Schreier sheaf, vanishing by translation, Lang–Weil,
  and the Fourier–Deligne input).

## Merge decisions

- **Rabin's criterion and certificate** are FF.0's (`FF.0/rabin-irreducibility-criterion`,
  `FF.0/rabin-irreducibility-certificate`). FF.0's certified presentations need them, and they rest only on Mathlib. FF.3
  imports them.
- **The monic polynomials of a given degree** (`FF.2/monic-polynomials-of-degree`) move from FF.3 to FF.2, because FF.2's
  L-series of functions on monic polynomials uses them and FF.2 precedes FF.3.
- **Duplicate sources merged:** Shoup (`SHOUP.V2`, the id the ClassicalArithmeticCompletion packet uses), Kowalski's
  elementary notes, and Bary-Soroker–Koukoulopoulos–Kozma.

## Requests made (31)

- **Tau Ceti:**
  - AlgebraicCurves (7): Artin–Schreier covers, constant field extensions, affine models, the function-field and curve
    dictionary, divisors and the genus, Weil differentials with Riemann–Roch, and residues;
  - AlgebraicCodingTheory (2);
  - EllipticCurves (2): layer 3's Hasse bound and Frobenius, and #E[ℓ] = ℓ²;
  - LocalFieldsRamification (1).
- **SchemeAndStackFoundations:** SF.0, SF.1 and SF.2 (three).
- **EtaleDualityAndPerverseSheaves EDC.2** (two), including the Grothendieck–Ogg–Shafarevich formula, for which no stage
  exists.
- **WeilConjectures:** WC.0, WC.3 and WC.5.
- **DeligneWeightsAndPurity:** DWP.0, DWP.6 and DWP.7.
- **ComputationalNumberTheory:** CN.0 (the cost and randomness model; executable presentations) and CN.5 (the certificate
  schema).
- **AdditiveCombinatorics AC.0.**
- **FunctionFieldArithmetic FA.5.**
- **ArithmeticGaloisRepresentations R01.3.**

## For the orchestrator

1. **Structural proposals:**
   - An owner for the Grothendieck–Ogg–Shafarevich formula.
   - Sub-layers for FF.1, FF.2 and FF.4.
   - The overlap with DrinfeldModulesAndTModules DM.0, which the audit flags: it constructs additive polynomials as the Ore
     ring L{τ} again. FF.4 plans the finite-field theory and DM.0 should import it.
2. **Source mistakes (34).** Among them:
   - errors in stated results of Goresky–Klapper's *Algebraic Shift Register Sequences* (Galois subrings, cyclic subgroups,
     autocorrelation values, decimation);
   - in a public permutation-polynomial survey, an error in a stated result (E504) and one in a proof (E513);
   - Kowalski's notes print the discriminant of X³ + aX + b wrongly (E601);
   - E307: the conductor formula in Fouvry–Kowalski–Michel–Sawin's applied ℓ-adic notes.
3. **Retired supplier.** None: this roadmap's inputs do not name a retired roadmap.

## Sources

The pass read 32 free sources, with URLs, sections and SHA-256 in the packet. Among them:

- Shoup v2;
- Kowalski's elementary exponential-sums notes;
- Deligne's *Sommes trigonométriques* (§§1–3);
- Fouvry–Kowalski–Michel–Sawin, *Lectures on applied ℓ-adic cohomology*;
- Keith Conrad's handouts;
- Sutherland's MIT 18.783 notes;
- Milne's ANT notes;
- Guruswami–Rudra–Sudan, *Essential Coding Theory*;
- Goresky–Klapper;
- public permutation-polynomial and AG-code notes;
- the Bary-Soroker–Koukoulopoulos–Kozma and Browning–Sawin papers.

**Missing:** SGA 4½ beyond §§1–3 of *Sommes trig.*, Lidl–Niederreiter, Iwaniec–Kowalski, and Ekedahl (1990).
