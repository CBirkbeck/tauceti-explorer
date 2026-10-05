# Handoff: BP-KTheoryFiniteLocalFields (issue #763)

## Current checkpoint — Codex — codex-nlUyak, 5 October 2026

Claim [5997778824](https://github.com/CBirkbeck/tauceti-explorer/issues/763#issuecomment-5997778824)
was confirmed by bot [5997782125](https://github.com/CBirkbeck/tauceti-explorer/issues/763#issuecomment-5997782125).
The whole issue was reread after confirmation. Branch:
`codex-nlUyak-k-theory-finite-local`. Only the four named deliverables are changed.
This is a **partial checkpoint**, not a complete plan or an implementation.
No second job was claimed. No supplier, campaign, decomposition or atlas file was edited.

### What changed

Seven new L.5 nodes decompose the published Nikolaus–Scholze IV.4 prime-field
calculation: the hidden p-adic filtration extension; TC^-; TP and the canonical
map; the opposite divisibility range of cyclotomic Frobenius; the finite C_p-Tate
connective cover; the cyclotomic-shift model with simultaneous generator
normalizations; and the TC fibre-sequence application to the characteristic-p
algebras used by L.5/L.6. The existing perfect-field TC theorem gains an
independent prime-field check. General fixed/Tate/shift/adjunction constructions
are requested from RT.2, and derived Hochschild/cotangent inputs from RT.1 with
RT.2’s low-degree THH comparison. No new generic cyclotomic object is defined.

The maps and indices are explicit: TC^- has
`Z_p[ũ,v]/(ũv-p)`, degrees 2 and -2; TP has `Z_p[v±1]`;
`can(ũ)=pv^-1`, `can(v)=v`, `φ(ũ)=v^-1`, `φ(v)=pv` in the
simultaneous shift-model normalization. The finite C_p-Tate target instead has
`F_p[v±1]`. Genuine C_(p^n) fixed points correspond to HM TR^(n+1).
The calculations include p=2. This does not extend the p-odd HM log-Witt/DVR
comparison to p=2. The three HZ_p algebra maps in NS Remark IV.4.17 are not identified.

Confirmed ownership finding RT-AREA-ktheory-1/39 is handled by moving the five
generic L.5 records log-witt-complex, log-witt-complex-derived-relations,
log-de-rham-witt-complex, log-de-rham-witt-level-one and
standard-filtration-quotient into the CR.4 request’s `importedSpecifications`.
Their exact definitions, 15 API names, nine tests, hypotheses, proof sketches,
uses and source references survive there. Their former IDs are superseded
provenance, not live nodes. Every local consumer now imports CR.4; the Freyd
existence/level-one source gap remains open as a supplier boundary. CR.4 is
requested to own universal log-Witt theory on CR.5:log-algebra; CR.6 owns its
Hyodo–Kato comparison. L.5 retains the ramified-DVR calculations and the HM
homotopy-orbit algebra used for its TR comparison. The full prelog complex is
kept distinct from the dlog-generated subgroup W_nΩ^r_log. The proposed
CR.5:log-algebra→L.5 edge is recorded without modifying the atlas or supplier.

For RT-AREA-ktheory-1/37: the Green node now imports the exact upstream
InductionRestriction Layer6 virtual-character/Brauer characterization, and its
atlas edge is proposed. Green’s specialized proof remains unread. The existing
RT.4:topological request now specifies the finite-group Atiyah–Segal completion
contract and KU^1(BG)=0. The Quillen equivalence uses the existing exact
StableHomotopyKTheory:H.3/plus-construction-universal-property supplier node;
its unread proof remains a requested supplier obligation. The unsupported
alternative using a simply-connected Whitehead theorem for nontrivial π_1
has been removed.

RT-AREA-ktheory-2/33 remains an import: the L.4 comparison node is explicitly
an application of RT.2’s general genuine/modern theorem, with HM index,
completion and local bounded-below hypotheses checked. Its connectivity
lemma’s torsion-to-torsion-free π_0 argument is now restricted to mixed
characteristic; general DVR connectivity uses only the cofibre sequence.
RT-AREA-ktheory-2/21 needs no duplicate finite-field K_3 proof: the current
K3BlochGroups V.5 nodes already import L.1’s calculation and transfer.

Reader concordance also restored the missing
L.6/equal-characteristic-unique-p-divisibility section and replaced the
stale duplicated integral-structure section from the unchanged packet. The
L.3/L.6 overview counts are corrected. The preceding Milnor uncountability
proof and every inherited source finding are preserved.

### Sources and baseline: fresh reads versus inherited evidence

The seven reviewed AUDIT-29 layer entries, campaign document, incident atlas
edges and relevant supplier records were read. JacobianChallenge and
GrothendieckEulerForms were read as the two nearby upstream models. The
InductionRestriction Layer6 text was read directly. No full new audit of the
96 inherited baseline declarations is claimed. Spot reads at the pins covered
PadicInt, ZMod, WittVector.frobenius and TauCeti.SplitK0.finrankEquiv. The
baseline object is byte-for-byte equal as JSON data to the inherited one.

All fresh source URLs, exact SHA-256 hashes and sections read are in packet
`sources`/`sourceVersions` and the reader’s “Sources read for this continuation”.
The source PDFs and extracted text were scratch only and are not needed to resume:

- Published NS Acta221(2018) IV.4 was read in full, printed pp.355–365, including
  the proofs. It has its own source ID `NikolausScholze.2018.published`; the
  inherited arXiv source ID/hash/II.4 locators were not overwritten.
- HM local-fields §3.2, pp.47–51 was reread. The fresh arXiv bytes have a
  different hash from the inherited PDF; both versions remain documented.
- Calmès et al. III v4 §3.1.1–3.1.10 was read for the newly routed targets,
  including Proposition3.1.4 and Remark3.1.10. The Annals version was not read.
- Abdurrahman–Venkatesh v1 §2.7, pp.16–17, both lemma proofs were read. The
  Inventiones version was not read. Existing finding
  PAPER-ABDURRAHMAN-VENKATESH-25/E3, about H_2(SL_2(F_9),Z)=Z/3, is a
  constraint on the pending proof, not a new published erratum claim.
- Atiyah–Segal1969 scanned pp.1,3,4,10 were inspected, including Theorem2.1 and
  Proposition4.2. Intervening proof pages still need reading by the supplier.
- Green1955’s AMS PDF returned403; no proof read is claimed.

Known NS capitalization typo PAPER-NIKOLAUS-SCHOLZE-18/E11 is normalized to
lowercase v. The two imported paper findings are cross-referenced by
`sourceIssueImports`, not duplicated among this packet’s 39 source findings.
The preceding continuation audit is retained in `continuationHistory`.

### Checks and limits

The packet has **254 nodes**, **209 local definition/construction API items**,
**117 local definition/construction tests**, **42 planets** (six per stage),
**96 baseline declarations**, **30 gaps** and **31 supplier requests**. All
seven coverage records remain partial. Of 252 inherited node IDs, 247 remain
live, 235 node records are unchanged, and five are migrated supplier
specifications. All 39 source-finding records are unchanged.

- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json`:
  zero errors and warnings against the existing pinned declaration index.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  zero problems. JSON syntax and `git diff --check` pass.
- Focused concordance audit: every live node has exactly one reader heading
  and its exact statement; all coverage remaining lists agree; all new Lean
  specifications and acceptance checks agree; all new literal NS excerpts
  occur in the downloaded PDF text. No live prerequisite/neededBy reference
  points to a superseded ID. Superseded references survive only in the
  explicitly preserved historical supplier specification.
- Focused dependency audit: for all 15 nodes with new/rewired prerequisites,
  no supplier path returns to that consumer, using integrated and blueprint
  node prerequisites and atlas-stage requires. The checker also verifies the
  packet’s internal graph. This is not a claim that the whole atlas was
  independently re-audited.
- Suggested Lean executable declarations are unchanged after stripping nested
  block and line comments. The added specifications require absent spectrum
  carriers and are honestly comments. No fake Prop-valued stand-ins were added.
- `lean-check research/blueprint/suggested/KTheoryFiniteLocalFields.lean`
  was attempted with 96GB available. It stopped at line1 before elaboration:
  the pinned shared build lacks
  `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.olean`.
  **This version was not compiled.** No build, update, cache command or language
  server was run. The prior successful compilation is historical evidence for
  the prior file only. No compiler was left running.

### Where the next worker resumes

Start with the two new routed-source gaps, not a new generic carrier:

1. Identify the design owner for general hermitian K/GW/L theory. Read its
   exact carriers, cartesian K/GW/L/Tate square, localization and shift
   conventions. Decompose Calmès III Theorem3.1.3, Proposition3.1.4,
   Remarks3.1.5–3.1.6 and the mixed-(0,2) local-ring comparison Remark3.1.10
   into L.1/L.6 applications. The even-q full-spectrum result is for every
   integer shift m; it is not merely a connective or rational equivalence.
2. Read the published Abdurrahman–Venkatesh §2.7 and corrected rank/exception
   hypotheses. Plan finite-rank H_3(Sp_(2r)(F_q),Z/2)→H_3(SL_(2r)(F_q),Z/2)
   and c_et:H_3(Sp_(2r)(F_q),Z)/2→F_q^×/2, with odd q. Split stabilization,
   universal-cover Hurewicz and the K_3/2 étale class. The SL_2(F_9) H_2
   exception has odd order, which suffices for the mod2 UCT; never import a
   blanket integral H_2=0 claim.
3. Obtain the precise RT.1/RT.2 and CR.4/CR.5 exports listed in the requests.
   Read Green’s proof and Atiyah–Segal’s full proof before closing their gaps.
4. Continue the inherited missing proof sources: Quillen1972 §11 and ℓ=2
   cohomology comparison, Gabber rigidity, Merkurjev’s K_2 torsion,
   Lindenstrauss–Madsen/continuity inputs, and the distinct integral
   divisible-component gaps. Every stage’s exact remaining list is in the
   packet and reader. Do not reopen the supplied Milnor uncountability proof.

The checkpoint is well below the node budget because those new scope chains
cannot yet be maintained at declaration-level depth. It must not be relabelled
complete solely because schema checks pass. Source hashes, scope constraints,
supplier contracts and exact resume points above survive scratch deletion.

---

## Historical checkpoint — Codex — codex-7e92bd, 26 September 2026

Claim comment 5849861034 was confirmed by bot comment 5849862048. The whole issue
was reread afterward. Initial snapshot:
`8772d3b7affda45bc1cad8d1880e78a2c06ebe99`. Only the four named deliverables
are submitted. No git commands were used.

**Partial checkpoint:** five new L.6 nodes close the positive-characteristic
Milnor uncountability proof gap. All 247 inherited IDs remain; 244 inherited
node records are unchanged. The three amended nodes are
milnor-k-of-local-fields, uniquely-divisible-summand and
equal-characteristic-integral-structure. All 39 source-finding IDs are retained;
E36 gains an alternative-proof reference and the other 38 records are unchanged.
All 29 supplier requests and every restructure proposal are retained. No stage
is closed and no implementation is claimed.

### The added proof

1. **uncountable-transcendence-basis:** binary sequences inject into k[[t]] and
   hence E=k((t)). A countable transcendence basis B would make k[B] countable,
   then make its algebraic extension E countable. The pinned cardinality bound
   applies to domains with torsion-free scalar action. No algebraically closed
   hypothesis or differential-form dimension formula is used.
2. **rational-symbol-residue-separation:** for r fixed basis variables a_i and
   every remaining b_j, apply the b_j-adic residue of F=k(B), then the a_i-adic
   residues in reverse order, ending in K^M_0=Z. The uniformizer is last, so the
   diagonal is +1; off-diagonal values vanish at the first residue. These are
   coordinate valuations on F, with no continuity assertion or extension to E.
3. **finite-stage-relation-descent:** a vanishing relation in K^M_n(E) uses a
   finite certificate of tensor multilinearity and Steinberg relations. Adjoin
   all entries of that certificate to F. Since E/F is algebraic, this yields a
   finite intermediate field where the relation already vanishes. The Milnor
   presentation is finitary; it need not be finitely presented.
4. **local-symbol-family-independent:** compose simple transfers along any
   finite generating tower. N res = D id for a positive integer D. Applying
   the separating residues gives D c_j=0 in Z, hence each c_j=0. Inseparable
   extensions cause no problem; no integral injectivity of arbitrary Milnor
   restriction maps or canonical choice-independent transfer is assumed.
5. **equal-characteristic-milnor-uncountable:** remove r=n−1 basis variables.
   The remaining uncountable independent family embeds into K^M_n(E), for
   every n≥1. This proof uses neither Moore nor Geisser–Levine. Unique
   divisibility and the Chern retraction remain separate, conditional inputs
   to the later integral Quillen-group conclusions.

General residues and transfers remain owned by K2SymbolsBrauer. The exact
imports are T.2/milnor-k-theory, T.3/higher-milnor-residues and
T.4/restriction-transfer-degree. The source puts the uniformizer first; T.3’s
last-slot normalization supplies the required sign. The full supplier nodes
were read, including the degree-zero normalization and finite-tower scope.

### Sources and baseline

Read the seven reviewed AUDIT-29 entries and the campaign document in full;
screened the incident atlas edges, relevant accepted RS-08/18/26/28 entries and
link records. Previously fully read GrothendieckEulerForms and JacobianChallenge
upstream documents are byte-identical in this snapshot. This continuation did
not reread the entire ClassFieldTheory or LocalFieldsRamification documents;
the previous worker's reads are retained as historical evidence below.

The K-book author draft has SHA-256
`a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
Reread the proofs of III.7.3, III.7.5.3 and the union-of-finite-extensions
argument around III.7.6.1–7.6.2 (PDF pp.254,256–257), III Exercise7.4 (p.265),
V.11.13 (p.466) and VI.7.1–7.2 (pp.515–516). Visually inspected pp.254 and256.
The five-step argument above is a worker-derived alternative; no Tate-paper
read is claimed. Source finding E36 remains a finding about the printed
argument even though this packet's corresponding gap is now filled.

Eight new baseline entries were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`: existence/algebraicity of a
transcendence basis, its polynomial-algebra equivalence, polynomial and algebraic
cardinality bounds, PowerSeries.mk and coeff_mk, and the injective power-series
inclusion into Hahn/Laurent series. The original 88 baseline records are
retained, without a claim of a new blanket audit of all inherited statements.

### Validation and exact limits

Inventory: 252 nodes, 224 API items, 131 test specifications (126 attached to
definitions/constructions and five inherited comparison tests), 42 planets,
96 baseline declarations, 28 gaps and 29 requests. All seven layers remain
partial. The new nodes are lemmas/theorems, not new definitions; their acceptance
conditions and four additional typed examples are included in the suggested file.

The full suggested file compiled with Lean 4.34.0-rc2: zero errors, 270 warnings,
all uses of `sorry`. All 90 imported Tau Ceti modules were freshly built from
f790474; all 8,483 reached Mathlib source files matched the pinned tree before
its matching cached objects were used. The five new signatures use the actual
tensor/Steinberg quotient and typed symbols, finite intermediate fields and
integer linear independence. The degree-one, degree-two and degree-three
examples invoke the new theorem; degree zero is countable through K^M_0=Z.
Compilation checks the proposed interfaces, not the missing proofs.

The inherited characteristic-zero signature remains. The new Laurent-series
signature supplies the positive-characteristic model, transported along the
field isomorphism in the packet's hypotheses. Integral Quillen K-theory and
Chern-retraction carriers remain missing in the suggested file; their existing
honest comments are retained. Do not infer that all 224 API items are typed.

The unmodified blueprint checker with the pinned declaration index reports
zero errors and warnings. Internal graph: 701 edges, acyclic. Focused explicit
supplier dependency paths do not return to any new node. This does not certify
inherited atlas-wide stage cycles. Packet/reader/signature parity was checked
for all new and amended node statements and proof plans.

Four-file intake: zero problems. Fresh publication guards matched all
23 captured input blobs and the four existing outputs at main
`aa9dde4813c60764490d15bba6ff576d08f96e60`. The issue body and confirmed claim were unchanged.

### Where to resume

The independent uncountability chain is ready for review. The next worker
should choose a different remaining gap, for example the Geisser–Levine supplier
contract, or a narrowly scoped Hesselholt–Madsen proof input. Preserve the earlier
three tame-formula nodes and all 39 source findings.

CMM2021's paper routing proposes RefinedTraceMethodsPartIIHenselianPairs as an
owner for the full Geisser–Levine input. No valid roadmap stage or packet for
that proposal exists in this snapshot. MotivicEtaleKTheory M.5d supplies BGK,
not the full Quillen Geisser–Levine theorem; do not mark the supplier gap closed
from the paper route alone. CMM's route also depends on L.2 Gabber rigidity,
so it cannot be used circularly to fill that rigidity gap. This is a route
screen, not a fresh proof extraction of CMM.

The inherited handoff below records other source and carrier limits. Its old
uncountability to-do and gap list are historical and are superseded by this
checkpoint; its other unresolved work remains.

---

## Previous checkpoint (retained history)

# Continuation handoff — Codex codex-a71f92 — 26 September 2026

Issue #763; claim comment 5849431609, confirmed by bot 5849432532.
Input main: 24cf1dd65d27b8fe22b8727d115e94cf5cd7bb10.
This is a **partial checkpoint**, not a finished blueprint or a formalization.
Only the four authorized deliverables change. All 244 inherited node IDs and all
36 inherited source findings are retained. The earlier handoff below is historical:
its counts and general-tame-source gap are superseded by this section.

## What this continuation establishes

The source gap for the general tame norm residue formula is resolved. Read Romyar
Sharifi, *Algebraic Number Theory*, current undated UCLA author PDF, Definition
9.3.2 and Theorem 9.3.8 with proofs, pp. 195–198, and checked the corresponding
Chapter 9 HTML. Sharifi evaluates reciprocity on the second argument and takes a
root of the first; T.7 does the reverse. Both use arithmetic Frobenius. Thus the
packet's negative exponent on its tame symbol is correct.

Three added lemma nodes precede the existing comparison:

- L.3/tame-unit-pair: triviality on integral units, using an unramified Kummer
  extension without assuming that its degree equals the exponent.
- L.3/tame-uniformizer-unit: the actual Frobenius calculation followed by uniqueness
  of the prime-to-p root-of-unity lift.
- L.3/tame-integer-coordinates: assembly from the four pairs, including diagonal
  sign, negative valuations and cancellation under changing the uniformizer.

The existing L.3/tame-component is the only inherited node changed. It now derives
the comparison on every K₂ class from its symbol values and separates a power map
from the primary-component projection. Five typed comparison tests were added.
The existing ℚ₅ quartic and ℚ₇ cubic tests remain; new tests include the diagonal,
negative exponents, parameter change and exponent one. No planet is added.

## Ownership and library evidence

Read all seven reviewed L.1–L.7 audits before planning, the campaign document,
atlas stages and incident edges, relevant accepted RS-08/RS-28/RS-26 entries,
RS-33's proposed H.2 route (not treated as accepted), and the accepted
LocalFieldsRamification/NumberFieldArithmetic link entries. Read the full upstream
ClassFieldTheory and LocalFieldsRamification roadmaps and the integrated T.7
classical-local-symbol node and T.3 tame-symbol/uniformizer-independence nodes.

No local reciprocity, local-field carrier, Frobenius, tame symbol or higher-local
construction is re-planned. The Layer 2 request gives the required derivation:
lift a finite residue splitting field, Hensel-lift its distinct roots, and pass to
the Kummer subextension. Layer 6 supplies unit triviality and arithmetic Frobenius.
The finite-extension degree can be a proper divisor of d.

At Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, reread teichmuller,
residue_teichmuller and eq_teichmuller in LocalField/Teichmuller.lean, and
exists_eq_mul_zpow_of_irreducible in LocalField/NormalizedValuation.lean. These are
inherited baseline entries, not new implementation claims. The last theorem gives
a valuation-one field unit part, which must be transported to the integer-ring
unit carrier. No blanket re-audit of the other 84 baseline entries is claimed.

**Unresolved stage-edge representation:** check_blueprint classifies a
tauceti:-prefixed prerequisite as a library declaration before looking up stage
IDs. The two new arithmetic lemmas therefore carry their four genuine upstream
edges in unresolvedPrerequisites, with precise supplier requests, not fake
baseline references. The focused cycle test includes those edges. Move them to
ordinary prerequisites after the checker supports this spelling. This is an
explicit partial boundary, not closure through omission.

## Source checks and limitations

PDF SHA-256: 153c8bb9be0f56a73b85cd9d192ec4b6360ce1dfeda3fd4babd7ee77aeb64f20.
Chapter 9 HTML SHA-256:
b77d079861a0f4387d81fe49c28acf753c96974198638af11d990e7fd06aaedb.
Both were retrieved 2026-09-26; exact URLs and read sections are in the packet.
The older Arizona edition has different numbering and is not this source.

Three new source findings are E37–E39: the unjustified full-degree norm equality
in Proposition 9.3.4(c), the root-count slip in Lemma 6.3.3's proof, and the missing
existence step in Lemma 6.4.1's proof. The norm equality was visually checked in
the PDF; ℚ₅, n=2, a=4, c=1 gives −3 on the left and −1 on the right. T.7 already
supplies the product-of-norms repair; its symbol is imported unchanged. The
unramified-existence proof stays with Layer 2, and the Teichmüller equivalence is
already pinned. No source correction was found in the recorded search; independent
review of these findings is still required. No errata-only issue is claimed here.

## Validation on this checkpoint

- Official check_blueprint with the full pinned declaration index: **0 errors,
  0 warnings**. 247 nodes, 224 definition/construction API items, 126
  definition/construction tests plus 5 comparison tests (131 total), 41 planets,
  88 baseline references, 29 gaps, 29 requests, 39 source findings; all seven
  stages partial, every implementation status unchecked.
- Fresh Lean elaboration at Mathlib
  082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
  f790474821cf4256814db967cb154e7af3d0c369: exit 0, **265 warnings, all declaration
  uses of the allowed proof placeholder**, no other diagnostics. Rebuilt 90
  transitive Tau Ceti imports from the pinned sources in isolated scratch;
  compared all 8,482 transitive Mathlib source files against the cache sources.
  The inherited file compiled first with 257 such warnings. This checks the
  suggested statement types, not the truth of their placeholder bodies.
- Existing symbol carriers are explicitly marked stand-ins in the inherited file.
  The new statements use them and do not claim that reciprocity is implemented.
- Preservation and affected-reader concordance checks passed: 244 stable IDs
  retained, exactly 1 old node changed and 3 added; no other stage's nodes changed.
- Combined declaration/stage graph: 6,838 declarations, 41,922 edges, no cyclic
  component involving any of the four affected nodes. Included the unresolved
  upstream edges; did not assert that unrelated inherited components were acyclic.
- 42,875 exact finite-field symbol-coordinate tests and 351,575 uniformizer changes
  passed over 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅, 𝔽₇, 𝔽₉, 𝔽₁₁. Non-prime fields used actual field
  multiplication, not integers modulo 4 or 9. These are sign/coefficient
  regressions, not proofs of local class field theory.
- Source-issue schema and source-version checks passed.

## Where to resume

The 29 other gaps are preserved. In particular, neither Merkurjev's characteristic-
zero p-torsion-freeness nor the Artin–Schreier Hilbert 90 input is supplied by this
checkpoint. Source work on those inputs should check the programme's newly routed
paper results before another source search. The higher-K and trace ownership
boundaries are unchanged. Replace supplier stand-ins only when the actual supplier
types are available, and resolve the upstream-stage parser limitation honestly.

---

# Historical handoff (preserved from the input checkpoint)

# Handoff: BP-KTheoryFiniteLocalFields (issue #763)

The blueprint of *K-theory of finite and local fields*, stages L.1–L.7, by Claude Code, session cc-38267a. The coordinator wrote the briefs; four authoring agents wrote one stage group each (L.1–L.2, L.3 and L.7, L.4–L.5, L.6); the coordinator merged the fragments, resolved their cross-references and checked the whole.

## Files

- `research/blueprint/packets/KTheoryFiniteLocalFields.json` (status `partial`, part `null`)
- `research/blueprint/readmes/KTheoryFiniteLocalFields.md`, generated from the packet so that the two agree
- `research/blueprint/suggested/KTheoryFiniteLocalFields.lean`
- `research/blueprint/handoff/BP-KTheoryFiniteLocalFields.md` (this note)

## What is closed

- **244 nodes:** 2 applications, 11 comparisons, 14 constructions, 14 definitions, 102 lemmas, 101 theorems.
  - By stage: L.1 39, L.2 17, L.3 18, L.4 35, L.5 83, L.6 41, L.7 11.
  - 224 API items and 126 unit tests, all with a §12 kind.
  - 41 planets, at most six per layer.
- **Baseline:** 88 declarations, each read at its file and line at the pins.
- **Coverage of the stage texts.** Every target of every stage text is realised by a node, imported through a request, or recorded as a gap. The coverage note of each stage maps its targets to its nodes.
- **Consumer requests.** Every request that other packets make of this roadmap is supplied:
  - ArithmeticKTheory N.2–N.6;
  - K3BlochGroups V.5, EllipticKTheory, HabiroNumberFields HB.2 and HigherLocalFields HL;
  - the exceptions are noted in the coverage notes.
- **Checks.**
  - `check_blueprint.py --index`: 0 errors, 0 warnings.
  - Stage cycles: none. The check covers atlas `requires` and `stageEdges` plus the node prerequisites of every packet and decomposition on a freshly pulled main.
  - Every excerpt was checked against the source text layers; none exceeds 300 characters.
  - The packet and the document contain no "sorry", Lean code or private paths.
- **Source issues:** 36 mistakes in the sources are recorded, with corrections, and the nodes use the corrected statements.
  - Brauer lifting: the lift of the standard representation must be taken as a virtual representation (K-book IV.1).
  - K-book V.6.9.2 fails at i = 1.
  - K-book Corollary VI.7.4.2 fails at p = 2, 3; the Handbook's Corollary 63 has it right.
  - The Handbook's H¹ formula before Theorem 61 is wrong for (ℚ₃, i = 7).
  - Several Hesselholt–Madsen misprints.

## What remains, precisely

**L.1** (partial):

- Quillen's vanishing of H̃_*(GL(F_q); F_p) (Quillen 1972, §11): gap, node L.1/gl-mod-p-acyclic.
- The prime ℓ = 2 (q odd) in the cohomology comparison: gap, nodes L.1/fpsi-cohomology-ring, L.1/gl-cohomology-detection, L.1/quillen-homology-iso.
- Quillen's Lemma 12 (abelian ℓ-subgroups of GL_n(F_q) are conjugate into C^m) and Quillen's detection for wreath products (The Adams conjecture, Prop. 3.4): gap, node L.1/gl-cohomology-detection.
- Green's theorem on Brauer characters: gap, node L.1/green-virtual-character.
- Browder's mod-ℓ ring structure and scholium; Araki–Toda multiplications on Moore spectra: gaps, nodes L.1/browder-mod-l-ring and L.1/mod-m-products (the latter also requested from StableHomotopyKTheory H.6).
- Answers to the requests to RefinedTraceMethods RT.4:topological (Adams operations on BU, Atiyah map, K̃U^1(BG) = 0; proposed as a Part II), StableHomotopyKTheory H.6 (Moore multiplications, Eilenberg–Moore spectral sequence), SchemeKTheoryOperations S.6 (Quillen–Hiller operations and Hiller's universality), GeneralAlgebraicKTheory K.7, KTheoryLowDegrees U.5 and U.6.
- Re-derive Mestel's Lemmas 26–29 (the classes c_i(W), e_{jr}(W) and the product formula) against Quillen 1972 §§8–9 before implementation (gap on the expository source).
- Once K2SymbolsBrauer--T.1 cites GeneralAlgebraicKTheory K.2:plus instead of the umbrella K.2 (restructure), add K2SymbolsBrauer:T.2/k2-finite-field and K2SymbolsBrauer:T.1/k2-pi2 as prerequisites of L.1/degree-two-symbols.

**L.2** (partial):

- Gabber's proof of rigidity for henselian pairs (Gabber 1992; Suslin 1984; Gillet–Thomason 1984): gap, node L.2/gabber-rigidity; every other L.2 node rests on it.
- Answers to the requests to tauceti:TauCetiRoadmap/LocalFieldsRamification (finite extensions of local fields and their integers; unramified extensions and the residue action of G_L), GeneralAlgebraicKTheory K.7 (K_*(O)-linearity of the localisation boundary) and KTheoryLowDegrees U.5 (the degree-one boundary).
- Confirmation by MotivicEtaleKTheory M.7 of the ownership split in restructure (M.7 imports L.2/gabber-rigidity; Suslin's rigidity for algebraically closed fields, K-book VI.1.1–VI.1.7.1, stays with M.7).

**L.3** (partial):

- Merkurjev's theorem (no p-torsion in U(E) for char E = 0) is cited, not decomposed: no public source of its proof was read (gap).
- Hilbert's Theorem 90 for K₂ in the Artin–Schreier case, used by L.3/k2-no-p-torsion-char-p, is cited to Merkurjev–Suslin (gap; the K-book's own treatment is circular).
- The general-d tame formula of L.3/tame-component is proved here by the classical local class field theory computation; the only source statement read is the case d = 2 over ℚ_p (Exercise III.6.7), so the formula should be checked against Serre, Local Fields XIV §3 (gap).
- Moore's own proof of the divisibility was not read; the p-part in characteristic 0 is proved through the degree-two norm residue theorem and local duality instead (gap).
- Requests to MotivicEtaleKTheory M.5, KTheoryLowDegrees U.3 and the upstream layers LocalFieldsRamification Layer 1 and ClassFieldTheory Layers 5 and 6 must be answered.

**L.4** (partial):

- Supply the cyclotomic structure on T(C) for linear Waldhausen categories (gap).
- Prove McCarthy's additivity for Φ = THH^{C_r}, Bökstedt's approximation lemma, Waldhausen's Lemma 1.4.1/Theorem 1.6.4 arguments for Φ, Thomason–Trobaugh 1.9.8 and the 3 × 3 lemma with HM's sign conventions (gap), or replace them by the Blumberg–Mandell localisation theorems for spectral categories.
- Supply the Dundas–McCarthy equivalence criterion, Morita invariance and Dundas' dévissage for HM's linear-category THH (gap).
- Answers to the requests to RefinedTraceMethods RT.1, RT.2 and RT.3.

**L.5** (partial):

- Prove the existence of the log de Rham–Witt complex and W_1ω = ω for log rings (gap and source issue: the two HM papers refer to each other).
- Prove the Lindenstrauss–Madsen inputs (π̄_*T(A), π_*(T(A);Z_p), their Proposition 4.3) and Remark 2.4.2 (gaps).
- Replace Tsalidis' theorem in Addendum 5.4.4 by Nikolaus–Scholze Corollary II.4.9 with the hypotheses checked (gap).
- Split the proofs of Propositions 5.5.4 and 5.5.5 and Theorem 5.5.1 into declaration-sized steps (the degree bookkeeping is recorded in proof steps only).
- Supply the continuity results and Kratzer's theorem behind HM 1997 Theorem D, and HM 1997 Theorem 5.1 (gap).
- Supply the Galois-cohomology inputs of Theorem 6.1.6 (Serre's residue sequence, Artin–Schreier) and obtain answers to the requests to MotivicEtaleKTheory M.1 and Tau Ceti ProfiniteCohomology layer 9.
- Supply TR^n_{q−λ}(k;p) for perfect k (HM 'cyclic polytopes' Proposition 9.1, cited in Hesselholt 2005) and the cyclic-polytope geometry behind HM 1997b Theorem B.
- Answers to the requests to RefinedTraceMethods RT.1–RT.3, CrystallineCohomology CR.4 and CR.5:log-algebra.

**L.6** (partial):

- Obtain Tate, 'Relations between K2 and Galois cohomology' (Handbook ref. [66]) and decompose the uncountability of K^M_n(𝔽_q((t))), n ≥ 3 (gap), or supply another proof.
- Obtain Dwyer–Mitchell and Thomason's calculation of the p-adic homotopy type of K^ét of a p-adic field and decompose the equivalences of L.6/hm-theorem-d, including the valuation-ring form (gap).
- Resolve the requests to MotivicEtaleKTheory M.1, M.4, M.5, M.6, M.7, M.8, ArithmeticGaloisDuality R02.1, CrystallineCohomology CR.4, RefinedTraceMethods RT.4:topological and Tau Ceti ClassFieldTheory Layer 5 / LocalFieldsRamification Layer 1, replacing the stage prerequisites by node ids once those blueprints exist.
- Assign an owner to the Geisser–Levine theorem (gap) and to cd_p ≤ 2 for complete discretely valued fields with perfect infinite residue field (gap).
- Decide whether the natural splitting in Hesselholt–Madsen's Theorem A for v > 1 is needed anywhere; if so, find its argument (gap).
- Rognes–Weibel's proof for p = 2 (K-book [161, 3.7], Handbook [51]) was not read; the p = 2 case rests on M.7's Quillen–Lichtenbaum statement for fields of 2-cohomological dimension 2.
- Route Examples VI.7.6–7.8 of the K-book (Handbook 64–66), which are local–global, to L.7 (restructure entry).

**L.7** (partial):

- The semilocal equivalence E ⊗_F F_v ≅ ∏_{w|v} E_w (NumberFieldArithmetic Layer 5) is requested, not planned here.
- Étale Chern classes and their functoriality (MotivicEtaleKTheory M.8), the étale–Galois comparison and henselian rigidity for étale cohomology (M.1), unramified subgroups and inflation (ArithmeticGaloisDuality D7) and the naturality of the cyclotomic trace (RefinedTraceMethods RT.3) are requested.
- L.7/hilbert-symbol-completion (c) inherits the Merkurjev gap of L.3.
- Karoubi's square is planned for discrete valuation rings only; the general Proposition V.7.5 is proposed for GeneralAlgebraicKTheory (restructure).

## Gaps

- **Quillen's vanishing of the mod-p homology of GL(F_q) is cited, not proved.** Needed by `L.1/gl-mod-p-acyclic`, `L.1/quillen-homology-iso`, `L.1/quillen-fibration`.
- **The prime 2 in Quillen's cohomology comparison is not treated in the sources read.** Needed by `L.1/fpsi-cohomology-ring`, `L.1/gl-cohomology-detection`, `L.1/quillen-homology-iso`.
- **Quillen's detection lemmas for GL_n(F_q) are cited, not proved.** Needed by `L.1/gl-cohomology-detection`.
- **Green's theorem on Brauer characters is cited, not proved.** Needed by `L.1/green-virtual-character`, `L.1/brauer-lift`.
- **Atiyah–Segal vanishing of K̃U^1 on classifying spaces is cited, not proved.** Needed by `L.1/fpsi-lifting`, `L.1/quillen-map`, `L.1/frobenius-is-adams`.
- **The Eilenberg–Moore spectral sequence is cited, not constructed.** Needed by `L.1/fpsi-cohomology`.
- **Browder's computation of the mod-ℓ ring of a finite field and the Araki–Toda multiplications are cited, not proved.** Needed by `L.1/browder-mod-l-ring`, `L.1/mod-m-products`, `L.1/algebraic-closure-mod-m-ring`, `L.2/mod-m-local-field-ring`.
- **Hiller's universality of the representation-ring map is cited, not proved.** Needed by `L.1/adams-on-finite-field-k`.
- **The decomposition of Quillen's proof follows an expository essay whose computations were not all re-derived.** Needed by `L.1/fpsi-cohomology-ring`, `L.1/gl-cohomology-detection`.
- **Gabber's rigidity theorem is cited, not proved.** Needed by `L.2/gabber-rigidity`, `L.2/rigidity-finite-residue-field`, `L.2/henselian-dvr-mod-m-splitting`.
- **Merkurjev's theorem on the torsion in K₂ of local fields was not obtained.** Needed by `L.3/merkurjev-p-torsion-free`, `L.3/moore-theorem`, `L.3/moore-mixed-characteristic`, `L.3/ring-of-integers-subgroup`, `L.7/hilbert-symbol-completion`.
- **Hilbert's Theorem 90 for K₂ in the Artin–Schreier case has no proof in the sources read and no owner.** Needed by `L.3/k2-no-p-torsion-char-p`, `L.3/moore-theorem`, `L.3/moore-equal-characteristic`.
- **The tame formula for the d-th power norm residue symbol is stated in the sources read only for d = 2 over ℚ_p.** Needed by `L.3/tame-component`, `L.3/hilbert-symbol-components`, `L.3/ring-of-integers-subgroup`, `L.3/moore-equal-characteristic`.
- **Moore's own proof of the divisibility was not read; the characteristic-zero p-part is proved by another route.** Needed by `L.3/moore-kernel-p-divisible-mixed-characteristic`, `L.3/moore-theorem`.
- **Cyclotomic structure on T(C) for a linear Waldhausen category is only sketched.** Needed by `L.4/thh-of-linear-waldhausen-category`, `L.4/tr-pro-spectrum`.
- **Proofs cited but not read in HM §1: McCarthy's additivity, Bökstedt's approximation lemma, Waldhausen's Lemma 1.4.1 and Theorem 1.6.4, Thomason–Trobaugh 1.9.8, Cartan–Eilenberg XVII.1.2.** Needed by `L.4/thh-additivity-theorem`, `L.4/thh-structure-maps-f-equivalences`, `L.4/isomorphism-nerve-degeneracy-equivalence`, `L.4/thh-fibration-theorem`, `L.4/thh-torsion-complexes-f-equivalence`, `L.4/thh-projective-complexes-f-equivalence`, `L.4/three-by-three-lemma`.
- **The Dundas–McCarthy equivalence criterion, Morita invariance and Dundas dévissage for THH are cited, not proved.** Needed by `L.4/dundas-mccarthy-equivalence-criterion`, `L.4/dvr-tr-agrees-with-ring-tr`, `L.4/thh-torsion-complexes-f-equivalence`.
- **Existence of the de Rham–Witt complex with log poles: the two sources refer to each other.** Needed by `L.5/log-de-rham-witt-complex`, `L.5/log-de-rham-witt-level-one`.
- **Lindenstrauss–Madsen, THH of number rings, not read.** Needed by `L.5/thh-of-dvr-mod-p`, `L.5/thh-of-dvr-p-adic`, `L.5/log-thh-mod-p`, `L.5/log-thh-low-degrees`, `L.5/reduction-mod-p-of-thh-dvr`, `L.5/norm-restriction-exact-low-degrees`, `L.5/log-de-rham-witt-tr-level-two`.
- **Remark 2.4.2 (π_*(T(A|K);Z_p)) is stated without proof but used in Lemma 5.6.1.** Needed by `L.5/log-thh-p-adic`, `L.5/frobenius-surjective-odd-degrees`.
- **Tsalidis' theorem (Addendum 5.4.4) not read; the Nikolaus–Scholze replacement must be checked.** Needed by `L.5/gamma-hat-all-levels`.
- **Inputs from Hesselholt–Madsen 1997 and other papers cited in HM 2003 §§3–5 and not decomposed.** Needed by `L.5/tr-log-dvr-is-log-witt-complex`, `L.5/norm-restriction-exact-low-degrees`, `L.5/tate-spectral-sequence-unramified`, `L.5/tate-spectral-sequence-deeply-ramified`, `L.5/log-thh-tame-descent`, `L.5/lubin-tate-unit-polynomial`, `L.5/cyclic-bar-construction-of-truncated-monoid`.
- **Continuity and perfect-field inputs of HM 1997 Theorem D.** Needed by `L.5/trace-equivalence-finite-witt-algebras`, `L.5/trace-isomorphism-for-local-field`.
- **Galois-cohomology inputs of Theorem 6.1.6 without an identified owner.** Needed by `L.5/tc-of-log-dvr-mod-p`.
- **TR^n_{q−λ}(k;p) for perfect k and the Geisser–Hesselholt TC sequence are cited.** Needed by `L.5/twisted-tr-of-regular-fp-algebra`, `L.5/relative-k-of-truncated-polynomial-over-perfect-field`, `L.5/tc-of-regular-fp-algebra`.
- **Uncountability of the Milnor K-groups K^M_n(E), n ≥ 3, and of U_n, n ≥ 3, for E = 𝔽_q((t)) is not proved in the sources read.** Needed by `L.6/milnor-k-of-local-fields`, `L.6/uniquely-divisible-summand`, `L.6/equal-characteristic-integral-structure`.
- **The p-adic homotopy type of étale K-theory of a p-adic field (input of Hesselholt–Madsen Theorem D) was not read.** Needed by `L.6/hm-theorem-d`.
- **cd_p(K) ≤ 2 for a complete discretely valued field K of characteristic 0 with perfect, not necessarily finite, residue field has no owner.** Needed by `L.6/hm-theorem-a`.
- **The natural splitting of K_{2s}(K; ℤ/p^v) ≅ H^0 ⊕ H^2 for v > 1 is asserted by Hesselholt–Madsen without a separate argument in the text read.** Needed by `L.6/hm-theorem-a`.
- **The Geisser–Levine theorem has no stage that names it.** Needed by `L.6/geisser-hesselholt-regular-local`, `L.6/equal-characteristic-completed-k-groups`, `L.6/milnor-k-of-local-fields`.

## Requests made

- **RefinedTraceMethods:RT.4:topological** (8 nodes): RT.4:topological's text: 'Construct topological complex K-theory from vector bundles, prove Bott periodicity and its spectrum-level multiplication ... Identify π_*ku=ℤ[β] and π_*KU=ℤ[β,β⁻¹]'. L.1 uses BU as a homotopy-commutative H-group with π_{2i}(BU) ≅ Z, π_{2i−1}(BU) = 0, and additionally needs, beyond that text: (a) Adams operations ψ^k: BU → BU as H-maps representing ψ^k on K̃U^0, with ψ^jψ^…
- **StableHomotopyKTheory:H.6** (36 nodes): H.6's text: 'Define E/m as the cofiber of multiplication by m on a spectrum. Prove the Bockstein exact sequence ... Construct exact couples from filtered spectra and convergence statements ... These are used in M and L'. L.1 needs, beyond the Bockstein node StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence: (a) the homotopy associative and commutative multiplication on the Moore spec…
- **GeneralAlgebraicKTheory:K.7** (11 nodes): K.7's text: 'Construct external products from biexact functors and their associativity, unit and symmetry homotopies. For commutative rings obtain graded-commutative K-groups. Prove compatibility with relative groups, localisation boundaries and transfers.' L.1 needs K(R) as a homotopy commutative ring spectrum (for K(R)/ℓ^ν to be a ring spectrum); L.2 needs the K_*(O)-linearity of the localisatio…
- **SchemeKTheoryOperations:S.6** (2 nodes): S.6's text: 'Construct λ-operations using a genuine higher K-theory construction, not just the exterior-power functor on objects. Establish Adams operations ψ^k and their multiplication law.' L.1 needs these for affine schemes in the Quillen–Hiller form of K-book IV.5: λ^k and ψ^k on K_0(A) × [X, BGL(A)^+] for commutative A, induced from the representation rings R_A(GL_n(A)) through q (Proposition…
- **KTheoryLowDegrees:U.6** (1 nodes): U.6's text: 'Use H.3 and K.2 to identify π₁ BGL(A)⁺ with the explicit quotient. ... the comparison must identify determinant and transfer, not merely provide an abstract isomorphism. Compute K₁ of Z, finite fields, ...'. L.1 imports K_1(F_q) = GL(F_q)/E(F_q) ≅ F_q^× by the determinant, natural in F_q.
- **KTheoryLowDegrees:U.5** (2 nodes): U.5's text: 'For a finite projective algebra extension construct transfer by restriction of scalars. Prove that, on a field's unit group, this agrees with the field norm. ... the boundary map from a discrete valuation field's units to K₀ of its residue field equals the valuation with the chosen convention.' L.1 uses the norm statement for finite fields; L.2 uses the boundary statement ∂[π] = [k] =…
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions** (3 nodes): Layer 0's 'Finite extensions, I' (finiteExtension_isNonarchimedeanLocalField: a finite extension of a nonarchimedean local field is one, with no structure assumed on L) and 'Finite extensions, II' (its integer ring is the integral closure, a henselian DVR with finite residue field). L.2 applies its henselian-DVR results to every finite subextension of L^sep.
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius** (3 nodes): Layer 2: 'For every f ≥ 1 there is exactly one unramified intermediate field K_f of AlgebraicClosure K with [K_f : K] = f' and the residue correspondence Gal(L/K) ≃ Gal(𝓀[L]/𝓀[K]) with the Frobenius; with Layer 4's exact sequence 1 → I_K → G_K → Ẑ → 1. L.2 uses that the residue fields of finite subextensions exhaust \bar F_q and that G_L acts on residue fields through a surjection onto Gal(\bar F_…
- **K2SymbolsBrauer:T.2:symbols** (1 nodes): Compatibility, not a supply: T.2:symbols' text 'Prove Matsumoto's theorem that the resulting map K₂ᴹ(F) → K₂(F) is an isomorphism' gives K2SymbolsBrauer:T.2/k2-finite-field (K_2(F_q) = 0 by symbols); L.1/degree-two-symbols recovers K_2(F_q) = 0 in Quillen's model and should cite it, but K2SymbolsBrauer--T.1's nodes T.1/k2-definition and T.1/k2-pi2 cite the umbrella stage GeneralAlgebraicKTheory:K.…
- **MotivicEtaleKTheory:M.5** (5 nodes): Two statements of M.5 ('For a field F and a prime ℓ invertible in F, prove K_j^M(F)/ℓ^r ≅ H^j(F, μ_{ℓ^r}^{⊗j})' and 'At the residue characteristic use the separate Bloch–Gabber–Kato logarithmic differential statement where L requires it'): (i) in degree j = 2, K₂(E)/p^ν ≅ H²(E, μ_{p^ν}^{⊗2}) for E a finite extension of ℚ_p (Merkurjev–Suslin), proved without Moore's theorem for local fields; (ii) B…
- **KTheoryLowDegrees:U.3** (3 nodes): SK₁(A) = 0 for a commutative semilocal ring A, hence K₁(𝒪) = 𝒪^× for the valuation ring of a local field and K₁ of a field is its unit group (U.3: 'Prove SK₁ vanishing for fields and commutative semilocal rings by explicit elementary reduction'). U.3's text: 'Prove SK₁ vanishing for fields and commutative semilocal rings by explicit elementary reduction'. L.6 needs K_1(𝔽_q[[t]], (t)) = 1 + t𝔽_q[[t…
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group** (4 nodes): From Layer 1's 'Structure of Kˣ': 'Prove that the torsion subgroup μ(K) is finite', with the API items 'finiteness of μ(K) and its order' and 'the p-part and the prime-to-p part of μ(K)', together with 𝒪[K]ˣ ≃ μ_{q−1} × U(K,1) and U(K,1) pro-p; used to write μ(E) = μ_{q−1}(E) × μ_{p^∞}(E) of order w = (q − 1)p^a, with a = 0 in characteristic p. Layer 1's 'Structure of Kˣ': 'Prove that the torsion …
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity** (2 nodes): Local reciprocity for finite abelian extensions (localArtinEquiv and its multiplicative form normResidue), with the arithmetic normalisation 'localArtinMap(π_K) = arithmeticFrobenius for an unramified extension' and the triviality of the Artin image of units on unramified extensions; used for the tame formula and for the norm criterion of the norm residue symbol.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality** (6 nodes): Local Tate duality for finite Galois modules of a p-adic field (Layer 5's 'duality'), in the form #H²(E, μ_{p^ν}^{⊗2}) = #H⁰(E, μ_{p^ν}) (K-book VI.7, p. 516: 'H²(E, μ_m^{⊗i+1}) is isomorphic to H⁰(E, μ_m^{⊗i})'). Layer 5's 'Construct local Tate duality from the evaluation pairing Hom(A,μ_n) × A → μ_n' (tateDualityPairing_perfect_mixed), 'Prove finiteness of H⁰, H¹, H² (finite_H), the cardinality …
- **tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places** (2 nodes): Layer 5.3's 'semilocalEquiv v : K_v ⊗[K] L ≃ₐ[K_v] ∏ (w : W v), L_w' with its value on pure tensors, and Layer 5.2's completionAlgHom v w with its tower equation; used for the transfer and semilocal completion formulas (Tau Ceti's adicCompletionExtension supplies the individual maps K_v → L_w at the pinned commit).
- **MotivicEtaleKTheory:M.8** (5 nodes): The étale Chern classes c_{i,n} : K_n(X; ℤ/m) → H^{2i−n}_et(X, μ_m^{⊗i}) for schemes X over ℤ[1/m] (M.8: 'Construct étale Chern classes … Prove compatibility with the higher K-theory Chern character, residues, norms and products'), with their functoriality in morphisms of schemes (K-book Definition V.11.5 (1)) and their compatibility with the localisation boundary; used for Spec F_v → Spec F, Spec…
- **MotivicEtaleKTheory:M.1** (8 nodes): The comparison of étale cohomology of Spec F with Galois cohomology of G_F for fields, compatible with pull-back along field extensions (restriction to decomposition groups), and, for a complete discrete valuation ring 𝒪_v with residue field k(v) and m invertible in k(v), H^j_et(Spec 𝒪_v, μ_m^{⊗i}) ≅ H^j(k(v), μ_m^{⊗i}) (M.1: 'scheme étale sites/Galois comparison'). The finite Tate twists μ_p^{⊗s}…
- **ArithmeticGaloisDuality:D7** (1 nodes): The unramified subgroups H^j_ur(F_v, M) ⊆ H^j(F_v, M) for unramified finite coefficients, identified with the image of inflation from the residue field, and the restriction maps H^j(F, M) → H^j(F_v, M) (D7: 'Specify topological restricted products, unramified subgroups, their transition maps').
- **RefinedTraceMethods:RT.3** (8 nodes): The cyclotomic trace K(A) → TC(A; p) and its naturality in exact functors (RT.3: 'Construct the Dennis/cyclotomic trace from the same K-theory functor and prove its naturality'), applied to − ⊗_{𝓞_F} 𝓞_v. The cyclotomic trace K(C) → TC(C;p) for linear Waldhausen categories (in particular C^b_z(P_A), C^b_q(P_A) and C^b_z(P_A)^q), natural in exact functors and multiplicative for bi-exact symmetric m…
- **RefinedTraceMethods:RT.1** (7 nodes): Hochschild homology HH_*(A) of commutative rings (cyclic model, Connes' B, relative groups for an ideal), cyclic homology HC and negative cyclic homology HC^- with the SBI sequence, the smooth characteristic-zero HKR isomorphism Ω^*_A ≅ HH_*(A) and its extension to filtered colimits (so to regular noetherian Q-algebras by Popescu), and étale base change HH_*(B) ≅ B ⊗_A HH_*(A) for A → B étale. RT.…
- **RefinedTraceMethods:RT.2** (18 nodes): THH of spectral categories (in particular of Z-linear categories via Eilenberg–Mac Lane spectra of the Hom-groups) by cyclic realisation, with the T-action as coherent data and its genuine cyclotomic structure (genuine C_{p^n}-fixed points, restriction R through geometric fixed points, inclusion F, transfer V), homotopy orbits, homotopy fixed points and Tate constructions with the norm cofibre seq…
- **CrystallineCohomology:CR.4** (11 nodes): On the Witt-vector carrier: the Frobenius F: W_n(A) → W_{n−1}(A), Verschiebung V: W_{n−1}(A) → W_n(A) and restriction R on Mathlib's TruncatedWittVector (Mathlib has F and V only on the untruncated WittVector), and the Witt complexes of Hesselholt–Madsen over Z_(p)-algebras (p odd) and over F_p-algebras with R, F, V, the relations FV = p, FdV = d, Fd[a] = [a]^{p−1}d[a], the initial Witt complex W_…
- **CrystallineCohomology:CR.5:log-algebra** (7 nodes): Prelog rings (R, α: M → (R,·)) with the group completion M^gp and morphisms of prelog rings; the induced prelog structure on W_n(R) through the Teichmüller map; log derivations (D, Dlog) into an R-module and the universal one ω^1_{(R,M)} = (Ω^1_R ⊕ (R ⊗ M^gp))/⟨dα(a) − α(a) ⊗ a⟩ with absolute Ω^1_R; the log differential graded rings (E^*, M) (a dga with prelog structure α: M → E^0 and Dlog: M → E^…
- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory** (1 nodes): Surjectivity of the Kummer map K^×/K^{×n} → H^1(G_K, μ_n) for n invertible in the field K (Hilbert 90 for K^sep/K), completing Tau Ceti's TauCeti.kummerClassMap (injective by TauCeti.kummerClassMap_injective). The layer's title: 'The Galois interface: Hilbert 90 and Kummer theory'. L.5 uses it with n = p for the degree-one case of Theorem 6.1.6 (K^×/K^{×p} = K_1(K;Z/p) ≅ TC_1(A|K;p,Z/p) ≅ H^1(K,μ_…
- **MotivicEtaleKTheory:M.7** (6 nodes): M.7's text: 'Construct étale K-theory through descent of finite-coefficient K-theory spectra, and the comparison from ordinary K-theory. Prove the relevant rigidity and étale descent theorems. Deduce Quillen–Lichtenbaum from M.5 and M.6 with an explicit degree range determined by the appropriate cohomological dimension.' L.6 needs: (i) for a field F of characteristic ≠ p with cd_p(F) ≤ 2 — in part…
- **MotivicEtaleKTheory:M.4** (1 nodes): M.4's text: 'Define motivic cohomology by these cycle complexes and prove the low-weight descriptions: weight zero, units/Picard in weight one, field Milnor K-theory on the diagonal'. L.6 needs K^M_n(F) ≅ H^n(F, ℤ(n)) for every field F and n ≥ 0 (Nesterenko–Suslin–Totaro), compatible with the coefficient sequence 0 → ℤ(n) → ℤ(n) → ℤ/m(n) → 0.
- **MotivicEtaleKTheory:M.6** (1 nodes): M.6's text: 'Identify the cycle-theoretic Chern character with the one constructed in S.7, including product and residue normalisations', with SchemeKTheoryOperations S.7: 'Higher Chow groups and the higher Chern character belong to M'. L.6 needs the Chern classes c_{i,i}: K_i(F) → H^{i,i}(F) ≅ K^M_i(F) of a field and K-book Lemma V.11.13: the composite K^M_i(F) → K_i(F) → K^M_i(F) is multiplicati…
- **ArithmeticGaloisDuality:R02.1** (4 nodes): R02.1's text: 'Construct cohomology for lattices and their torsion quotients through a comparison with the canonical continuous-cohomology construction. Prove the relevant Mittag–Leffler and lim¹ statements before interchanging cohomology and inverse limit. Treat T, V=T[1/p], and V/T separately.' L.6 needs, for G = G_L (L/ℚ_p finite) and T = ℤ_p(i): H^j(G, T) ≅ lim_ν H^j(G, T/p^ν) when the H^{j−1}…

## Structural proposals

- **Rigidity for henselian pairs is owned by L.2; MotivicEtaleKTheory M.7 imports it** (ownership).
- **Finite-coefficient K-theory of rings is planned in L.1** (ownership).
- **K2SymbolsBrauer T.1 cites the umbrella GeneralAlgebraicKTheory:K.2, which blocks L.1 from importing K_2(F_q) = 0** (cycle).
- **RefinedTraceMethods, Part II: Adams operations and classifying spaces in topological K-theory** (part-ii).
- **Proposed sub-layers of L.1** (sub-layers).
- **Duplicates listed by the audit for L.1 and L.2 are imported, not re-planned** (ownership).
- **The global-to-local K-theory map above p is owned by L.7; PadicHodgeRegulators D.4 imports it** (ownership).
- **Hilbert's Theorem 90 for K₂ and the torsion theorems for K₂ of fields have no owner** (ownership).
- **Karoubi's square in general belongs to GeneralAlgebraicKTheory** (ownership).
- **Real places of a number field are outside L.7's text but inside N.6's wild kernel** (rescope).
- **The localisation splitting of K₂ of a local field is L.2's** (move-nodes).
- **General TR/TC comparison is RT.2's; L.4 owns the Hesselholt–Madsen specialisation** (ownership).
- **THH analogues of Waldhausen's additivity, fibration and resolution theorems are owned by L.4** (ownership).
- **RT.3 and RT.6 test calculations import from L.5 only where the graph allows** (ownership).
- **CrystallineCohomology CR.5:log-algebra should own absolute log differentials of prelog rings** (rescope).
- **'Logarithmic de Rham–Witt' in HL.2 and 'de Rham–Witt with log poles' in L.5 are different objects** (ownership).
- **Proposed sub-layers of L.4 and L.5 for the atlas** (sub-layers).
- **Hesselholt–Madsen Theorem D (1997) and the trace isomorphism for local fields are placed in L.5** (ownership).
- **The completed K₃ carrier and its rank and torsion are owned by L.6; PadicHodgeRegulators D.3 imports them** (ownership).
- **Abelian-group tools for divisible components: one owner** (ownership).
- **Stage links that L.6's prerequisites add** (links).
- **The local–global examples of K-book VI.7.6–7.8 (Handbook 64–66) belong to L.7** (ownership).
- **Proposed sub-layers of L.6 for the atlas** (sub-layers).

## Suggested Lean file

**Compiled.** `research/blueprint/suggested/KTheoryFiniteLocalFields.lean` (4788 lines) elaborates with exit code 0 against Mathlib 082e2d3 and the Tau Ceti f790474 sources. Its only warnings are 257 `declaration uses 'sorry'`.

- **How it was compiled.** The local Mathlib-082e2d3 project does not build the Tau Ceti modules the file imports, so those were compiled with `lean -o` from the f790474 sources and placed first on `LEAN_PATH`. The file header says so.
- **Hygiene.** A copy with `autoImplicit` off also compiles, so no typo became an implicit variable. There is no `set_option`, no root import, and no `True`, `Unit` or opaque carrier.
- **What is stated in Lean.**
  - 70 of the 224 API items, 70 of the 126 unit tests (as `example`s) and 66 of the theorem nodes.
  - 10 of the 28 objects:
    - the Brauer character (with a real body) and the Brauer lift;
    - the norm-residue map and the Moore kernel;
    - the Tate complex;
    - the Witt-vector residue map and the modified Verschiebung;
    - the iterated Frobenius derivation;
    - the maximal divisible subgroup and the p-adic Tate module.
  - Honest stand-ins: Milnor K-theory, the Steinberg group with Steinberg's K₂, the w-invariants, the tame, conic and Hilbert symbols, and log differentials as an explicit quotient.
- **What is a comment instead.** Everything that needs K-theory spectra, K-groups of degree at least 3, THH/TR/TC, BU or de Rham–Witt complexes names its missing carrier and supplier. Every packet name (244 node ids, 224 API names, 126 test names) appears in the file.
- **Corrections found while formalising.** They were applied to the packet:
  - the range of the Tate–homology identification (it starts at i = −2);
  - the Bott map, a homomorphism on all of μ_m;
  - negative twists in the w-invariant formula;
  - two de Rham–Witt tests: the naive map is additive, and it is the twisted Leibniz rule that fails; and when V_π agrees with V;
  - classical against derived Hochschild homology of a perfect field;
  - the hypothesis of the Brauer-character change of embedding;
  - the Tate module of (ℚ_p/ℤ_p)^λ, for finite λ only;
  - Mathlib's finite-field norm formula, added to the baseline;
  - neededBy recomputed for every request.

## Sources

Read (versions and SHA-256 in the packet):

- The K-book: An Introduction to Algebraic K-theory, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
- Algebraic K-theory of rings of integers in local and global fields, Charles Weibel (https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf).
- K-theory and topological cyclic homology of henselian pairs, Dustin Clausen, Akhil Mathew, Matthew Morrow (https://arxiv.org/abs/1803.10897).
- On the K-theory of finite fields, Peter J. Haine (https://math.berkeley.edu/~phaine/files/KFF.pdf).
- Algebraic K-theory of finite fields, David Mestel (https://www.cs.ox.ac.uk/people/david.mestel/essay.pdf).
- Corrections to “The K-book: an introduction to algebraic K-theory”, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf).
- On the K-theory of local fields, Lars Hesselholt, Ib Madsen (https://arxiv.org/abs/math/9910186).
- Class Field Theory, J. S. Milne (https://www.jmilne.org/math/CourseNotes/CFT.pdf).
- Topological Milnor K-groups of higher local fields, Ivan Fesenko (https://msp.org/gtm/2000/03/gtm-2000-03-006p.pdf).
- Bloch groups, algebraic K-theory, units, and Nahm's conjecture, Frank Calegari, Stavros Garoufalidis, Don Zagier (https://arxiv.org/pdf/1712.04887v3).
- On the K-theory of finite algebras over Witt vectors of perfect fields, Lars Hesselholt and Ib Madsen (https://www.math.nagoya-u.ac.jp/~larsh/papers/004/paper.pdf).
- Cyclic polytopes and the K-theory of truncated polynomial algebras, Lars Hesselholt and Ib Madsen (https://www.math.nagoya-u.ac.jp/~larsh/papers/007/polytope.pdf).
- K-theory of truncated polynomial algebras, Lars Hesselholt (https://www.math.nagoya-u.ac.jp/~larsh/papers/s01/handbook.pdf).
- On the p-typical curves in Quillen's K-theory, Lars Hesselholt (https://www.math.nagoya-u.ac.jp/~larsh/papers/005/acta.pdf).
- On the de Rham–Witt complex in mixed characteristic, Lars Hesselholt and Ib Madsen (https://www.math.nagoya-u.ac.jp/~larsh/papers/013/final.pdf).
- On the K-theory of complete regular local F_p-algebras, Thomas Geisser and Lars Hesselholt (https://www.math.nagoya-u.ac.jp/~larsh/papers/011/paper.pdf).
- On topological cyclic homology, Thomas Nikolaus and Peter Scholze (https://arxiv.org/abs/1707.01799).

Not obtained, and cited only through the sources above (each such step is a gap):

- **Quillen.** His 1972 Annals paper on the cohomology and K-theory of GL over a finite field, and the 1971 papers.
- **Quillen's inputs.** Green's theorem on Brauer characters (1955), Browder's and Araki–Toda's multiplications, Hiller's λ-operations, and Atiyah–Segal.
- **Rigidity and local fields.** Gabber's rigidity paper and Gillet–Thomason; Suslin's 1984 paper on the K-theory of local fields.
- **K₂ and étale K-theory.** Merkurjev's and Tate's papers on K₂; Dwyer–Mitchell and Thomason on étale K-theory.
- **Trace methods.** Lindenstrauss–Madsen; Rognes–Weibel's two-primary calculations.

## For a continuation

- **Close the gaps** from those sources as they become available. Replace the stage-level requests by node ids once the supplier blueprints exist (RefinedTraceMethods, MotivicEtaleKTheory, KTheoryLowDegrees U.3/U.5/U.6, SchemeKTheoryOperations S.6).
- **Split the long proofs** of Hesselholt–Madsen 5.5.1, 5.5.4 and 5.5.5 into declaration-sized steps.
- **Ownership, via the restructure entries.**
  - Rigidity in L.2, which MotivicEtaleKTheory M.7 would then import.
  - The semilocal K-theory map in L.7 and the completed K₃ in L.6, which PadicHodgeRegulators D.3/D.4 would import.
- **K₂(𝔽_q).** L.1 proves K₂(𝔽_q) = 0 in Quillen's model rather than importing K2SymbolsBrauer T.2/k2-finite-field. In the current stage graph that node lies downstream of L.1, because K2SymbolsBrauer--T.1 cites the umbrella stage GeneralAlgebraicKTheory:K.2; with that citation changed to K.2:plus, the import becomes possible (restructure).
