# BP-MotivicEtaleKTheory--M.5d handoff

Worker: Codex — codex-7e92bd. Refs #959. First checkpoint; no inherited
packet, reader, suggested file, handoff or integrated decomposition existed.
Claim comment 5850041226 was confirmed by bot comment 5850042059; the whole
issue was reread after confirmation. No git commands were used.

## Completed in this checkpoint

The characteristic-p differential-symbol entrance has 18 nodes: 6
constructions, 1 definition, 10 lemmas and 1 theorem. There are 24 API items,
21 unit tests, 5 planets, 23 baseline references, 7 gaps, 3 supplier requests
and 3 proposed source findings. All six required coverage records are partial;
no whole stage or implementation is claimed complete.

The nodes construct dlog on units, tensor powers, the imported Milnor quotient,
and its reduction modulo p; establish the Steinberg relation, naturality and
products; define the Artin–Schreier operator and its kernel; and corestrict the
symbol to that kernel. The coefficient formula is promoted to its own lemma
because fixedness consumes it. The elementary checks are the bijective
weight-zero map, injectivity in weight one conditional on the explicit Cartier
supplier, and positive-degree vanishing of forms and mod-p Milnor groups over
perfect fields. The Milnor quotient is not replaced by an exterior algebra.

The reader gives the proof plans, API and tests for every new object. It pins
absolute forms, the empty wedge, the additive exact-form quotient, the
Frobenius scalar convention, and the sign relative to Bloch–Kato. It also gives
the precise unfinished BGK proof itinerary and keeps Quillen coefficient groups
and the Geisser–Levine theorem distinct from Milnor reduction modulo p.

## Inputs and ownership

Read all scoped stage descriptions and the owner README, all six reviewed
AUDIT-30 records (26 targets), the accepted RS-08 decisions involving this
roadmap, and all 147 extracted relevant link/stage-edge records. Previously
fully read upstream GrothendieckEulerForms and JacobianChallenge documents
were byte-verified unchanged. The immutable worker, protocol and upstream
instructions were verified and consulted. No whole-roadmap source-coverage
claim is made from that screen.

K2SymbolsBrauer:T.2/milnor-k-theory supplies the Milnor presentation. Its actual
statement and API were reread. Generic ordinary forms/differential/product
and pullback remain owned by DerivedDeRhamCohomology:DD.2; inverse Cartier and
its all-field extension belong to DD.3. Both requests name exact carriers and
identities. In particular ν and the exact subgroup are not F-submodules.

PadicMeasuresIwasawaAlgebras:L5 is the named M.8 determinant supplier. The
fresh-main guard found an update from 14 L3 nodes to 32 L2/L3 nodes. All 18
new L2 statements and the L5 coverage record were read; the new nodes concern
weighted measures, Mahler derivations and Amice moments, while L5 remains
not_read. The request was retained and the supplier snapshot refreshed. No
irrelevant L2/L3 node is cited as if it supplied determinants.

Open Mathlib PR and Zulip archive searches were made for dlog, Cartier, Milnor
and de Rham work. The relevant design lead is Joël Riou's Mathlib PR #18551,
head 5888c0081ba867ede5c60d3060f2d674d932b53c: the de Rham complex uses exterior
powers of KaehlerDifferential with a base-ring-linear differential. Its
differential signature, square-zero statement and complex carrier were read.
That direction is recorded in the DD.2 request, without importing an unpinned
PR. A broad Kaehler search was not exhaustively read; no exhaustive negative
claim about upstream PRs is made.

## Sources actually read

- Weibel's 29 August 2013 author K-book: III.7 differential-symbol construction,
  Lemma 7.7, Definition 7.7.1 and Theorem 7.7.2, printed 250–251 / PDF 258–259.
  The next PDF page was read as an Izhboldin lead; its proof is not fully read.
- Bloch–Kato, *p-adic étale cohomology*, published IHES 63 (1986): all of §2,
  printed 113–118 / PDF 8–13, with visual formula checks; reference page 152.
  No other section is claimed read.
- Kurihara–Fesenko, published GT Monographs 3 appendix: all A2, printed 36–41 /
  PDF 6–11; the key formulas on 36–37 and 40 visually checked. A1 was not read.
  E1–E3 identify the wrong residue degree, an unlabeled/missing Cartier arrow,
  and the invalid strict-chain enumeration for the printed partial order.
  The original BK text supplies the intended conventions; correcting these
  three defects is not claimed to certify the entire supplementary proof.

URLs, versions, hashes and access dates are in the packet. The publisher TOC
and targeted correction searches found no existing correction; novelty is
unestablished and findings await independent review. Kato 1982 §1, Kato 1980
local class field theory II §3.3 Lemma 13, and Illusie I(5.7.5) remain unread.
Extracted pages of other K-book sections were not counted as read.

## Exact continuation

1. Preserve these eighteen IDs. Discharge or refine DD.2/DD.3 requests on the
   existing carriers. Prove the absolute Z/F_p comparison, the additive de Rham
   quotient, Cartier naturality and ker(D)=F^p for arbitrary fields.
2. Acquire Kato 1982 §1 and decompose BGK surjectivity and the elimination
   input in BK equation (2.6). Do not assume the theorem as a single opaque
   proof premise. For the relative argument split the norm/trace compatibility,
   prime-to-p descent, adapted p-basis, lexicographic reduction and relative
   Cartier diagram into declarations.
3. Build BK Lemma 2.2 and the semilocal groups of (2.3), including tame residues
   in degree q−1, the unit presentation, specialization and its relative
   kernel. Prove the DVR realization and filtered-colimit passages actually
   used to reach arbitrary fields. The packet gives no proof of these yet.
4. Read Illusie's logarithmic de Rham–Witt exact sequence and decompose BK
   Corollary 2.8, retaining the initially only right-exact top row and the Tor
   step. Separately source the prime-to-characteristic Bockstein induction and
   its allowed inseparable reductions from M.5c.
5. Complete every remaining M.6/M.6a/M.6b filtration, layer comparison,
   exact-couple/convergence and rational-operations target; every M.7 étale
   descent, rigidity, comparison-range and real/2-primary correction target;
   and all M.8 arithmetic regulators, lattices, realizations, norm relations
   and Selmer/determinant applications. The coverage lists retain the exact
   work and named generic owners. No scoped stage was dropped by RS-08.

## Validation

The full suggested file compiled with Lean 4.34.0-rc2: zero errors, 66
warnings, all `declaration uses sorry` warnings. Its one Tau Ceti module was
freshly built from f790474; the 1,978 reached Mathlib source files were
byte-matched to 082e2d3. All eighteen node forms, twenty-four API entries and
twenty-one test examples are typed. Signature inspection specifically checked
that the characteristic hypotheses survived elaboration on modPSymbol,
forms_p_smul and perfect_modP_zero. Imported T.2/DD.2/DD.3 stand-ins are
labelled, and no Prop-valued stand-in asserts a missing theorem.

The unmodified blueprint checker with the pinned declaration index reports
zero errors and zero warnings. The internal graph has 28 edges and is acyclic.
Explicit supplier-node prerequisite traversal does not return to a new node;
this is not certification of every inherited atlas-wide stage edge. API/test
name agreement, six-stage scope, source hashes, all unchecked statuses and
absence of local paths were checked. No existing unrelated snapshot file was
modified except the read-only supplier refresh in scratch; publication contains
exactly the four authorized new deliverables.

Four-file intake: zero problems. Final publication guard matched all 50
captured input blobs after the reviewed supplier refresh at main
`2b7a9eaff6e45705f025d2e393ac1c6b2ea9f2ba`. All four outputs remained absent,
the issue body was unchanged, and bot confirmation 5850042059 still owned the claim.
