# Verification of the Chebotarev link-map red team

**Job:** `REV-RT-LINK-tauceti_TauCetiRoadmap_Chebotarev`, issue #4350.
**Reviewer:** ChatGPT, session `gpt6-c84e12`, 30 September 2026.
**Result:** both medium findings confirmed, with the application qualifications below. This completes the two-finding verification, not a new catalogue-wide link audit.

## Independence and scope

The original link author (`cgp-780fc5e50f71`), its reviewer (`codex-hjdg0j`) and the red-team author (`codex-rtOQ9t`) are different from this worker. The claim was acknowledged by bot comment 5911050317. This worker's earlier DIT16 verification and motives-area checkpoint did not author any of these inputs.

The review snapshot is `ecced2e18c470f3c48133f312dc0646b43325c07`. The red team's production-graph experiment used the earlier snapshot `63dd274b65dec5cad2b579767df28ba8e75c8938`; its counts and no-path assertions are not presented as independently reproduced results here.

Only the review JSON, this report and the job handoff are submitted. The link map, packets, historical reviews and generated atlas remain unchanged.

## Decision and exact destinations

All identifiers below are existing stages; no new roadmap or replacement theorem is proposed.

| Finding | Supplier | Consumer | Verdict |
|---|---|---|---|
| 1 | `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` | `HabiroNumberFields:HB.2` | Confirmed |
| 2 | `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` | `KTheoryLowDegrees:U.4` | Confirmed |
| 2 | `tauceti:TauCetiRoadmap/Chebotarev#layer-4-cyclotomic-galois-characters` | `KTheoryLowDegrees:U.4` | Confirmed |

The focal map has negative `examined` records with empty `hits` for both consumers, and no corresponding links. The current consumer extracts also omit these suppliers from their `requires` lists. This establishes the focal omissions. It does not by itself establish the absence of every possible indirect path in the entire atlas.

Use `inferred` links: the canonical consumer descriptions specify their mathematical targets but do not explicitly name Chebotarev. An explicit request inside a research packet strengthens the reason; it does not replace the required quotation from the canonical endpoint document.

Canonical evidence for the fixer:

- HB.2, `content/campaign/HabiroNumberFields/README.md`: "Establish CGZ's comparison with the finite Chern class under the precise good-n assumptions."
- U.4, `content/campaign/KTheoryLowDegrees/README.md`: "Use class-field-theory inputs with their actual statements where the argument requires them."
- Chebotarev Layer 10, `content/tau-ceti/Chebotarev/README.md`: "infinitude of every Frobenius class" and "State invariance under finite symmetric difference as a corollary."
- Layer 4 of that document specifies the arithmetic action on a primitive root as its absolute-residue-norm power. Copy the exact Markdown substring from the source when encoding the quotation; do not remove backticks or silently reverse Frobenius.

## Finding 1: Habiro comparison and prime selection

The accepted review marker in the accessible `HabiroNumberFields.json` packet coexists with `status: partial`. The explicit Layer 10 request names `HB.2/chebotarev-detection` and `HB.2/local-R-is-an-isomorphism`; I read both relevant node records and the request. Neither an accepted planning request nor a dependency link closes their remaining mathematical obligations.

The independent source check was Calegari–Garoufalidis–Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's Conjecture*, arXiv:1712.04887v3, Proposition 4.2 and proof, pp.22–23, and Theorem 5.2 and its proof, pp.26–27. The detection and local-comparison arguments select primes through Kummer and cyclotomic extensions. This is stronger than requesting a prime in a rational arithmetic progression alone: a prime must also have the stipulated action on the Kummer data.

The dependency is therefore the following conditional use of the general theorem. First construct the finite Galois compositum and prove that the simultaneous restrictions extend to an automorphism, retaining the source's odd-prime-power and root-of-unity hypotheses. Then apply Layer 10 to its conjugacy class and discard the finitely many bad primes. Infinitude survives that deletion. The consumer still proves its local-to-global implications, the local map's properties and the scalar comparison; none follows merely from positive density.

**Apply the fix:** add the single Layer 10-to-HB.2 relationship, name both consumer nodes in its reason, and replace the obsolete negative `examined` record. Do not add effective Chebotarev, duplicate the theorem in HB.2, or promote packet coverage.

## Finding 2: the arithmetic K-theory inputs

The decisive independent evidence is the canonical U.4 Bass–Milnor–Serre target together with Bass–Milnor–Serre, *Solution of the congruence subgroup problem for SL_n (n >= 3) and Sp_2n (n >= 2)*, Publ. Math. IHES 33 (1967), Appendix (A.5)–(A.8), printed pp.82–83. The proposed contracts follow from the following separate steps.

For (A.7), use class-field existence and reciprocity to identify the relevant finite-index idele-class quotient with a finite abelian Galois group. Infinitude of the prime representatives in a chosen class is then the abelian case of Chebotarev. The identification is a separate input, not part of Layer 10.

For the number-field assertion in (A.8), let `m >= 2` and suppose a primitive `m`-th root is not in `k`. Then `k(zeta_m)/k` has a nonidentity automorphism. Layer 10 gives infinitely many unramified primes with that Frobenius, still infinitely many after removing primes above `m`. Layer 4 computes its arithmetic action as `zeta_m -> zeta_m^(N p)`. If `N p` were 1 modulo `m`, this action would fix a generator, contradicting the choice. Here `N p` is the cardinality of the residue field; it need not equal the underlying rational prime.

**Apply the fix:** add both listed U.4 relationships with the exact canonical evidence and update `examined`. Preserve the class-field existence/reciprocity supplier separately. Do not transport this number-field contract to the subsequent function-field statement, infer effective bounds, or treat it as a proof of SK1 vanishing.

The large `KTheoryLowDegrees--U.1.json` packet was not independently decoded/read: text readers failed or returned empty content, and a blob read returned base64 rather than usable selected text. Its two request/node descriptions and partial/unreviewed status are reported by the red-team input, not independently certified by this review. The confirmation rests on the original BMS statements and the existing canonical U.4 target, so it does not depend on accepting that packet.

## Evidence and reading limits

Repository files inspected include the worker protocols; the focal link map; the Chebotarev and ArithmeticDirichletSeries roadmap documents; both consumer documents and extracts; and the relevant Habiro packet nodes, request and review marker. This is a targeted verification, not a fresh full reading of every packet, every library declaration, or all fifteen retained link proofs.

The relevant frozen blobs are:

| File | Git blob |
|---|---|
| Red-team result | `7275fc4434f4b248ebee0d8de35f1826e175a7a3` |
| Focal link map | `44a3d250080e4da5454446e14da8aa6390272529` |
| Chebotarev README | `349f69cb6108f6e525ff0085668814afa625185f` |
| Habiro README | `b4e452c4738fc7b9a6659eacd8526929a6c1c5ef` |
| KTheoryLowDegrees README | `9827f3e5c4a3d71829ca19446ea80dfee89bdd6e` |
| Official red-team checker | `c736ae33fd46ec11c6e718be27479d9d5a520211` |

Primary texts opened on 30 September 2026:

- CGZ v3: https://arxiv.org/pdf/1712.04887v3 (the unversioned PDF also resolved to v3 during reading).
- BMS version of record: https://www.numdam.org/item/PMIHES_1967__33__59_0.pdf, with article record https://numdam.org/articles/10.1007/BF02684586/.

The specified passages were read in parsed PDF text. Screenshot attempts failed, and source byte downloads did not succeed. No fresh PDF hash, image-level verification or published/preprint collation is claimed. This review alleges no new error in either published source; it verifies the particular dependency contracts. The BMS record links an erratum, which was not independently read, so this report does not claim to have checked all corrections.

The pinned library baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No new library-presence or formalisation claim is made.

## Validation and application boundary

The unmodified `scripts/check_redteam.py` was copied to scratch, and its Git blob hash was verified. The complete actual red-team input was also copied and checked against its Git blob hash; it is not an ID-only projection. The official checker passed on both the input and review files. Supplemental assertions check two distinct findings, exactly two confirmed verdicts and no trailing whitespace in the submitted text files.

No Lean file was written or compiled. No production atlas rebuild, whole-graph reachability/cycle check, `check_links` integration run or exhaustive axiom audit was performed in this verification. The red team's graph experiment remains provenance, not a newly passed check. The fixer must run the current quotation, link, integration and cycle checks after adding the three relationships, accounting for concurrent changes. Retain the previously accepted links and their eight caveats unless separately reviewed evidence warrants a change.
